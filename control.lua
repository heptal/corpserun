script.on_event(defines.events.on_pre_player_died, function(event)

  local player = game.players[event.player_index]
  local inventories = {"quickbar","main","guns","ammo","armor","tools","trash"}

  for i=1,#inventories do
    local inventory = player.get_inventory(defines.inventory["player_"..inventories[i]])
    while next(inventory.get_contents()) ~= nil do
      for item,qty in pairs(inventory.get_contents()) do
        local items = inventory.find_item_stack(item)
        player.surface.spill_item_stack(player.position, items, true)
        inventory.remove(item)
      end
    end
  end

end)