local Direction = require("scripts/libs/direction")
local Questions = require("scripts/quiz/questions")
local Helpers   = require('scripts/ezlibs-scripts/helpers')
local TblUtils  = require('scripts/utils/table-utilities/main')
local StrUtils  = require('scripts/utils/string-utilities/main')


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

local function getAllQuizSpawns()
    local area_ids = Net.list_areas()
    local quiz_placeholderName = "Quiz Giver"
    for i, area_id in ipairs(area_ids) do
        local quiz_npcs = GetAllTiledObjOfXType(area_id, "Quiz NPC")
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
            local bot_questions = SelectRandomItemsFromTableClamped(questions, tonumber(question_count))

            local trivia_answered_message = custom_properties["trivia pre-next message"]
            local trivia_mode = custom_properties['trivia mode']
            local trivia_welcome_message = custom_properties['trivia welcome message']
            local trivia_closing_message = custom_properties['trivia closing message']
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
                do_once = StringToBool(do_once),
                trivia_mode = StringToBool(trivia_mode),
                is_complete = {},
                trivia_answered_message = trivia_answered_message,
                trivia_welcome_message = trivia_welcome_message,
                player_scores = {}
            }
        end
    end
end

getAllQuizSpawns()

-- local function sendExitMessage(
--     setIsCompleteForPlayer,
--     player_id,
--     message,
--     mugshot_texture,
--     mugshot_animation,
--     condition
-- )
--     return async(function()
--
--     end)
-- end

local function do_quiz(player_id, quiz_bot)
    return async(function()
        local mugshot_texture = bot_mug_path .. quiz_bot.asset_name .. image_suffix
        local mugshot_animation = bot_mug_path .. "mug" .. anim_suffix
        local answers = 0
        local len = #quiz_bot.bot_questions
        local player_pos = Net.get_player_position(player_id)
        local bot_pos = Net.get_bot_position(quiz_bot.bot_id)
        local original_bot_direction = quiz_bot.direction
        local player_scores = quiz_bot.player_scores
        Net.set_bot_direction(quiz_bot.bot_id, Direction.from_points(bot_pos, player_pos))
        quiz_bot.player_scores[player_id] = 0
        if (quiz_bot.trivia_mode == true) then
            print("trivia mode is active")

            if (quiz_bot.trivia_welcome_message ~= nil) then
                await(Async.message_player(player_id, quiz_bot.trivia_welcome_message,
                    mugshot_texture, mugshot_animation
                ))
            end

            for i, question in pairs(quiz_bot.bot_questions) do
                local question_text = question.question
                local options = question.options
                local correct_answer = question.answer

                await(Async.message_player(player_id, question_text,
                    mugshot_texture, mugshot_animation
                ))
                local result = await(Async.quiz_player(player_id,
                    options[1],
                    options[2],
                    options[3],
                    mugshot_texture,
                    mugshot_animation
                ))
                if (result == correct_answer) then
                    quiz_bot.player_scores[player_id] = tonumber(quiz_bot.player_scores[player_id]) + 1
                    print("Correct answer")
                end

                answers = answers + 1
                if (answers < len) then
                    await(Async.message_player(player_id, quiz_bot.trivia_answered_message,
                        mugshot_texture, mugshot_animation
                    ))
                end
            end

            if (answers == len) then
                if (quiz_bot.complete_message == nil) then
                    await(Async.message_player(player_id, default_complete_message, mugshot_texture,
                        mugshot_animation))
                    quiz_bot.is_complete[player_id] = true
                end
                if (quiz_bot.trivia_closing_statements ~= nil) then
                    await(Async.message_player(player_id, quiz_bot.complete_message,
                        mugshot_texture, mugshot_animation
                    ))
                end


                await(Async.message_player(player_id, quiz_bot.complete_message, mugshot_texture, mugshot_animation))
                await(Async.message_player(player_id, "Here is your final score!",
                    mugshot_texture, mugshot_animation
                ))
                await(Async.message_player(player_id, "SCORE : " .. tostring(quiz_bot.player_scores[player_id]),
                    mugshot_texture, mugshot_animation
                ))
                quiz_bot.is_complete[player_id] = true
                return
            end
        end

        if ((quiz_bot.do_once ~= false and quiz_bot.is_complete[player_id] == nil) or quiz_bot.do_once ~= true) then
            for i, question in pairs(quiz_bot.bot_questions) do
                local question_text = question.question
                local options = question.options
                local correct_answer = question.answer

                await(Async.message_player(player_id, question_text,
                    mugshot_texture, mugshot_animation
                ))
                local result = await(Async.quiz_player(player_id,
                    options[1],
                    options[2],
                    options[3],
                    mugshot_texture,
                    mugshot_animation
                ))
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
