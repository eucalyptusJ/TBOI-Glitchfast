local glitchedBreakfast = RegisterMod("Glitched Breakfast", 1)

function glitchedBreakfast:onUpdate(player)
    if player:GetCollectibleNum(CollectibleType.COLLECTIBLE_BREAKFAST, true) >= 1 then
        for i, entity in pairs(Isaac.GetRoomEntities()) do
            local itemPedestal = entity:ToPickup()
            local data = entity:GetData()
            if itemPedestal ~= nil then
                if itemPedestal.SubType == CollectibleType.COLLECTIBLE_BREAKFAST then
                    entity:AddEntityFlags(EntityFlag.FLAG_GLITCH)
                end
            end
        end
    end
end

glitchedBreakfast:AddCallback(ModCallbacks.MC_POST_PEFFECT_UPDATE, glitchedBreakfast.onUpdate)