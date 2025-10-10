local helpers = require('scripts/ezlibs-scripts/helpers')
local TblUtils = require('scripts/utils/table-utilities/main')
local AutoPartyAreas = {}
local Party = {}
local MAX_PLAYER_COUNT = 4

local function setup()
    local areas = Net.list_areas()
    for i, area_id in next, areas do
      local area_id = tostring(area_id)  
		  AutoPartyAreas[area_id] = {auto_party = false, target_trivia_room = ''}

    if Net.get_area_custom_property(area_id, "Target Trivia Room") ~= nil then
      AutoPartyAreas[area_id].target_trivia_room = Net.get_area_custom_property(area_id, "Target Trivia Room")
      AutoPartyAreas[area_id].waiting_room = area_id
      print("The value of Auto Party in "..area_id.. " is true. \n") 
    end 
		if Net.get_area_custom_property(area_id, "Auto Party") == "true" then
			AutoPartyAreas[area_id].auto_party = true
  end
  end
end

setup()

local function startTriviaNight(party, target_trivia_room)
  
end

Net:on("player_area_transfer", function(event)
  local debug = true
  local player_current_area = Net.get_player_area(event.player_id)
  local objects = Net.list_objects(player_current_area)
  local partyArea = AutoPartyAreas[player_current_area].target_trivia_room
  if (AutoPartyAreas[player_current_area].waiting_room == player_current_area) then
  async(function()      
  local result =  await(Async.message_player(event.player_id, "Party is ready, Prepare to transfer to your Trivia Night Room. Your Host will be D3str0y3d255"))
    if (result ~= nil) then
    print(event.player_id)
    print(Party)
    print(partyArea)
    Net.lock_player_input(event.player_id)
    local spawn_objs = TblUtils.GetAllTiledObjOfXType(partyArea, "Player Spot")
    if (spawn_objs ~= nil) then
      Net.transfer_player(event.player_id, partyArea, true, spawn_objs[1].x, spawn_objs[1].y, spawn_objs[1].z, "Up Right")
    end  
    end
  end)
  return
end

  if (AutoPartyAreas[player_current_area][1] == "true") then
    print("Entered an Auto Party Area. \n" .. "player_id : " .. event.player_id .. '\n' .. "area_id : " .. player_current_area)
  end

  if (#Party < MAX_PLAYER_COUNT and debug ~= true) then 
    table.insert(Party, tostring(event.player_id))
  end
end)

-- Net:on("tick", function(event)
--  { delta_time: number (seconds) }
--  print(event.delta_time)
-- end)