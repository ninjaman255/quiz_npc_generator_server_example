local Direction                = require("scripts/libs/direction")
local Questions                = require("scripts/quiz/questions")
local helpers                  = require('scripts/ezlibs-scripts/helpers')

-- Path information
local bot_sheet_path           = "/server/assets/ezlibs-assets/eznpcs/sheet/"
local bot_mug_path             = "/server/assets/ezlibs-assets/eznpcs/mug/"
local image_suffix             = ".png"
local anim_suffix              = ".animation"

-- Bot information
local bot_id                   = ''
local quiz_bots                = {}
local default_fail_message     = "Incorrect! Try again!"
local default_complete_message = "Good job! You got everything right!"
local default_question_count   = 3

local function selectRandomItems(tbl, count)
    -- Check if inputs are valid
    if not tbl or count <= 0 then return {} end

    -- Ensure we don't exceed table length
    local new_count = math.min(count, #tbl)

    -- Create a copy of the original table
    local tempTable = {}
    for i = 1, #tbl do
        tempTable[i] = tbl[i]
    end

    -- Create result table
    local result = {}

    -- Select random items
    for i = 1, new_count do
        -- Get random index from remaining items
        local randomIndex = math.random(#tempTable)

        -- Add selected item to result
        table.insert(result, tempTable[randomIndex])

        -- Remove selected item from temporary table
        table.remove(tempTable, randomIndex)
    end

    return result
end

local function getAllOfXType(area_id, type)
    local objects = Net.list_objects(area_id)
    local results = {}
    for i, object_id in next, objects do
        local object = Net.get_object_by_id(area_id, object_id)
        object_id = tostring(object_id)
        if object.type == type or object.class == type then
            table.insert(results, object)
        end
    end
    return results
end

function toboolean(str)
    local bool = false
    if str == "true" then
        bool = true
    end
    return bool
end

local function getAllQuizSpawns()
    local area_ids = Net.list_areas()
    local quiz_placeholderName = "Quiz Giver"
    for i, area_id in ipairs(area_ids) do
        local quiz_npcs = getAllOfXType(area_id, "Quiz NPC")
        for i, npc in ipairs(quiz_npcs) do
            local custom_properties = npc.custom_properties
            local asset_name = custom_properties["asset name"]
            if (asset_name == nil) then
                print(quiz_placeholderName .. " For " .. area_id .. " Must have an asset associated with it")
                return
            end
            local do_once = custom_properties['do once']
            local direction = custom_properties["direction"]
            local question_count = custom_properties["question count"]
            local failure_message = custom_properties["failure message"]
            local complete_message = custom_properties["complete message"]
            local texture_path = bot_sheet_path .. asset_name .. image_suffix
            local anim_path = bot_sheet_path .. asset_name .. anim_suffix
            if (question_count == nil) then
                print("question count wasnt defined. Defaulting the value to 3")
                question_count = default_question_count
            end
            local questions = Questions
            local bot_questions = selectRandomItems(questions, tonumber(question_count))
            bot_id = Net.create_bot({
                name = "",
                area_id = area_id,
                texture_path = texture_path,
                animation_path = anim_path,
                x = npc.x,
                y = npc.y,
                z = npc.z,
                direction = direction,
                solid = true
            }) -- bot_id
            quiz_bots[bot_id] = {
                bot_id = bot_id,
                failure_message = failure_message,
                complete_message = complete_message,
                asset_name = asset_name,
                direction = direction,
                bot_questions = bot_questions,
                do_once = toboolean(do_once),
                is_complete = {}
            }
        end
    end
end

getAllQuizSpawns()


local function do_quiz(player_id, quiz_bot)
    return async(function()
        local mugshot_texture = bot_mug_path .. quiz_bot.asset_name .. image_suffix
        local mugshot_animation = bot_mug_path .. "mug" .. anim_suffix
        local answers = 0
        local len = #quiz_bot.bot_questions
        local player_pos = Net.get_player_position(player_id)
        local bot_pos = Net.get_bot_position(quiz_bot.bot_id)
        local original_bot_direction = quiz_bot.direction
        Net.set_bot_direction(quiz_bot.bot_id, Direction.from_points(bot_pos, player_pos))
        if (quiz_bot.do_once ~= false and quiz_bot.is_complete[player_id] == nil) then
            for i, question in pairs(quiz_bot.bot_questions) do
                local question_text = question.question
                local options = question.options
                local correct_answer = question.answer

                await(Async.message_player(player_id, question_text,
                    mugshot_texture, mugshot_animation
                ))
                local result = await(Async.quiz_player(player_id, options[1],
                    options[2],
                    options[3],
                    mugshot_texture, mugshot_animation))
                if result ~= correct_answer then
                    if (quiz_bot.failure_message == nil) then
                        await(Async.message_player(player_id, default_fail_message, mugshot_texture, mugshot_animation))
                        break
                    end
                    await(Async.message_player(player_id, quiz_bot.failure_message, mugshot_texture, mugshot_animation))
                    break
                end
                answers = answers + 1
            end
            if (answers == len) then
                if (quiz_bot.complete_message == nil) then
                    await(Async.message_player(player_id, default_complete_message, mugshot_texture, mugshot_animation))
                    quiz_bot.is_complete[player_id] = true
                    return
                end
                await(Async.message_player(player_id, quiz_bot.complete_message, mugshot_texture, mugshot_animation))
                quiz_bot.is_complete[player_id] = true
                return
            end
        end

        if (quiz_bot.do_once ~= true) then
            for i, question in pairs(quiz_bot.bot_questions) do
                local question_text = question.question
                local options = question.options
                local correct_answer = question.answer

                await(Async.message_player(player_id, question_text,
                    mugshot_texture, mugshot_animation
                ))
                local result = await(Async.quiz_player(player_id, options[1],
                    options[2],
                    options[3],
                    mugshot_texture, mugshot_animation))
                if result ~= correct_answer then
                    if (quiz_bot.failure_message == nil) then
                        await(Async.message_player(player_id, default_fail_message, mugshot_texture,
                            mugshot_animation))
                        break
                    end
                    await(Async.message_player(player_id, quiz_bot.failure_message, mugshot_texture,
                        mugshot_animation))
                    break
                end
                answers = answers + 1
            end
            if (answers == len) then
                if (quiz_bot.complete_message == nil) then
                    await(Async.message_player(player_id, default_complete_message, mugshot_texture,
                        mugshot_animation))
                    return
                end
                await(Async.message_player(player_id, quiz_bot.complete_message, mugshot_texture, mugshot_animation))
                return
            end
            return
        end
        if (quiz_bot.is_complete[player_id] ~= nil) then
            if (quiz_bot.complete_message == nil) then
                await(Async.message_player(player_id, default_complete_message, mugshot_texture, mugshot_animation))
                return
            end
            await(Async.message_player(player_id, quiz_bot.complete_message, mugshot_texture, mugshot_animation))
        end
    end).and_then(function()
        Net.set_bot_direction(quiz_bot.bot_id, quiz_bot.direction)
    end)
end





Net:on("actor_interaction", function(event)
    if (quiz_bots[event.actor_id] == nil) then return end
    local quiz_bot = quiz_bots[event.actor_id]
    do_quiz(event.player_id, quiz_bot)
end)
