--Start of Mod
local Mod =  RegisterMod("TestMod123", 1)
local game = Game()
local testing = true
local player = Isaac.GetPlayer(0)

local TECHNOLOGY = Isaac.GetItemIdByName("Technology")
local BOTFLY = Isaac.GetItemIdByName("Bot Fly")
local TWISTEDPAIR = Isaac.GetItemIdByName("Twisted Pair")
local isTech = false   

--Check for Update
function Mod:check()
  local player = Isaac.GetPlayer(0)
  local room = game:GetRoom()
  local entities = Isaac.GetRoomEntities()
end

if player:HasCollectible(TECHNOLOGY) and player:HasCollectible(BOTFLY) and player:HasCollectible(TWISTEDPAIR) then
    isTech = true
    Isaac.DebugString("Player has all three items for the transformation")
    Game():GetPlayer(0):ClearCostumes()
    Game():GetPlayer(0):AddCostume(Isaac.GetCostumeIdByPath("gfx/characters/techfly.anm2"))
end

function Mod:onCache(player, cacheFlag)
    if game:GetFrameCount() == 1 then
  local isTech = false
end
if cacheFlag == CacheFlag.CACHE_DAMAGE then
    if isTech then
      player.Damage = player.Damage *1.25
      Isaac.DebugString("Damage Given")
    end
  end


isTech = false
end
  function Mod:onUpdate()
	-- SPAWN ITEMS FOR TESTING
	if testing == true then
    if game:GetFrameCount() == 1 then
			Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, TECHNOLOGY, Vector(295,300), Vector(0,0), nil)
			Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, BOTFLY, Vector(345,300), Vector(0,0), nil)
			Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, TWISTEDPAIR, Vector(395,300), Vector(0,0), nil)
            Isaac.DebugString("Spawned Items for Testing")
    end
  end
end

