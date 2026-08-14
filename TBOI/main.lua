--Start of Mod
local Mod = RegisterMod("Tech Transformation", 1)
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
Game():GetPlayer(0):ClearCostumes()
end

if cacheFlag == CacheFlag.CACHE_DAMAGE then
    if isTech then
      player.Damage = player.Damage *1.25
    end
  end
  function Mod:onUpdate()
	-- SPAWN ITEMS FOR TESTING
	if testing == true then
    if game:GetFrameCount() == 1 then
			Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, TECHNOLOGY, Vector(295,300), Vector(0,0), nil)
			Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, BOTFLY, Vector(345,300), Vector(0,0), nil)
			Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, TWISTEDPAIR, Vector(395,300), Vector(0,0), nil)
    end
  end
end


Mod:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, Mod.newRun)
Mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, Mod.onCache)
Mod:AddCallback(ModCallbacks.MC_POST_UPDATE, Mod.onUpdate)
Mod:AddCallback(ModCallbacks.MC_ENTITY_TAKE_DMG, Mod.damage)
Mod:AddCallback(ModCallbacks.MC_POST_UPDATE, Mod.check)