trust = {};
database = getDatabase()

function onEnable()
    database:queryupdate("CREATE TABLE IF NOT EXISTS `trust` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `player` VARCHAR, `by` VARCHAR)");
    
    local result = database:query("SELECT * FROM trust;");
	while result:next() do
		trust[result:getString("player")] = result:getString("by");
	end
	
    print("Trustlist loaded");
end


function onPlayerCommand(event)

	local cmd = StringUtils:explode(event.command, " ");
	
	-- admins only
	if not event.player:isAdmin() then return true end
	
	if #cmd >= 1 then
		
		if cmd[1] == "/trust" then
			if #cmd == 2 then
				trust[cmd[2]] = event.player:getName()
				local query = "INSERT INTO trust (player, by) VALUES ('" .. cmd[2] .. "','" .. event.player:getName() .. "');"
				database:queryupdate(query);
				event.player:sendTextMessage("You successfully have added " .. cmd[2] .. " to the trust list")
			end
			
		elseif cmd[1] == "/untrust" then
			if #cmd == 2 then
				local query = "DELETE FROM trust WHERE player= '" .. cmd[2] .. "'"
				database:queryupdate(query);
				trust[cmd[2]] = nil
				event.player:sendTextMessage("User " .. cmd[2] .. " has been successfully removed from the trust list")
			end
			
		elseif cmd[1] == "/trustlist" then
			for key,value in pairs(trust) do
				event.player:sendTextMessage("Player:" .. key .. "  -  Was Added to the list by: " .. value)
			end
		end
	end
end
addEvent("PlayerCommand", onPlayerCommand);



function onPlayerBlockPlace(event)
	if not trust[event.player:getName()] then
		event:setCancel(true);
	end

end
addEvent("PlayerBlockPlace", onPlayerBlockPlace);


function onPlayerBlockDestroy(event)
	if not trust[event.player:getName()] then
		event:setCancel(true);
	end

end
addEvent("PlayerBlockDestroy", onPlayerBlockDestroy);


function onPlayerConstructionPlace(event)
	if not trust[event.player:getName()] then
		event:setCancel(true);
	end

end
addEvent("PlayerConstructionPlace", onPlayerConstructionPlace);


function onPlayerConstructionRemove(event)
	if not trust[event.player:getName()] then
		event:setCancel(true);
	end

end
addEvent("PlayerConstructionRemove", onPlayerConstructionRemove);


function onPlayerConstructionDestroy(event)
	if not trust[event.player:getName()] then
		event:setCancel(true);
	end

end
addEvent("PlayerConstructionDestroy", onPlayerConstructionDestroy);


function onPlayerObjectPlace(event)
	if not trust[event.player:getName()] then
		event:setCancel(true);
	end

end
addEvent("PlayerObjectPlace", onPlayerObjectPlace);


function onPlayerObjectRemove(event)
	if not trust[event.player:getName()] then
		event:setCancel(true);
	end

end
addEvent("PlayerObjectRemove", onPlayerObjectRemove);


function onPlayerObjectDestroy(event)
	if not trust[event.player:getName()] then
		event:setCancel(true);
	end

end
addEvent("PlayerObjectDestroy", onPlayerObjectDestroy);


function onPlayerObjectPickup(event)
	if not trust[event.player:getName()] then
		event:setCancel(true);
	end

end
addEvent("PlayerObjectPickup", onPlayerObjectPickup);


function onPlayerTerrainFill(event)
	if not trust[event.player:getName()] then
		event:setCancel(true);
	end

end
addEvent("PlayerTerrainFill", onPlayerTerrainFill);


function onPlayerTerrainDestroy(event)
	if not trust[event.player:getName()] then
		event:setCancel(true);
	end

end
addEvent("PlayerTerrainDestroy", onPlayerTerrainDestroy);


function onPlayerChestPlace(event)
	if not trust[event.player:getName()] then
		event:setCancel(true);
	end

end
addEvent("PlayerChestPlace", onPlayerChestPlace);


function onPlayerChestRemove(event)
	if not trust[event.player:getName()] then
		event:setCancel(true);
	end

end
addEvent("PlayerChestRemove", onPlayerChestRemove);


function onPlayerChestDestroy(event)
	if not trust[event.player:getName()] then
		event:setCancel(true);
	end

end
addEvent("PlayerChestDestroy", onPlayerChestDestroy);


function onPlayerVegetationPlace(event)
	if not trust[event.player:getName()] then
		event:setCancel(true);
	end

end
addEvent("PlayerVegetationPlace", onPlayerVegetationPlace);


function onPlayerVegetationDestroy(event)
	if not trust[event.player:getName()] then
		event:setCancel(true);
	end

end
addEvent("PlayerVegetationDestroy", onPlayerVegetationDestroy);


function onPlayerVegetationPickup(event)
	if not trust[event.player:getName()] then
		event:setCancel(true);
	end

end
addEvent("PlayerVegetationPickup", onPlayerVegetationPickup);


function onPlayerGrassRemove(event)
	if not trust[event.player:getName()] then
		event:setCancel(true);
	end

end
addEvent("PlayerGrassRemove", onPlayerGrassRemove);


function onInventoryToChest(event)
	if not trust[event.player:getName()] then
		event:setCancel(true);
	end

end
addEvent("InventoryToChest", onInventoryToChest);


function onChestToInventory(event)
	if not trust[event.player:getName()] then
		event:setCancel(true);
	end

end
addEvent("ChestToInventory", onChestToInventory);


function onChestItemDrop(event)
	if not trust[event.player:getName()] then
		event:setCancel(true);
	end

end
addEvent("ChestItemDrop", onChestItemDrop);


function onPlayerHit(event)
	if not trust[event.player:getName()] then
		event:setCancel(true);
	end

end
addEvent("PlayerHit", onPlayerHit);


function onNpcHit(event)
	if not trust[event.player:getName()] then
		event:setCancel(true);
	end

end
addEvent("NpcHit", onNpcHit);
