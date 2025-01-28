local e = defines.events
local utils = require("script_utils")
local storage_name = "heat_extractor"
local on_entity_created = function(event)
    local entity
    if event.entity and event.entity.valid then
        entity = event.entity
    end
    if event.created_entity and event.created_entity.valid then
        entity = event.created_entity
    end
    if not entity then return end
    if entity.name == "heat-extractor" then
        utils.save_to_storage(storage_name, entity)
    end
end
local on_removed_entity = function(event)
    if event.entity and event.entity.valid and event.entity.surface
        and event.entity.name == "heat-extractor" then
        local entity = event.entity
        utils.delete_storage_entity(storage_name, entity)
    end
end
local self_burn = function(event)
    if event.effect_id == "sol-fire-sticker" and storage[storage_name] then
        local surface = game.surfaces[event.surface_index]
        -- game.print(#storage[storage_name])
        for i, entity in pairs(storage[storage_name]) do
            -- game.print(entity.position.x .. " " .. entity.position.y)
            if entity.valid and entity.temperature and entity.temperature >= 900 then
                --生成火焰
                surface.create_entity {
                    name = "fire-flame",
                    position = { entity.position.x + 1, entity.position.y + 1 },
                    initial_ground_flame_count = 5
                }
                surface.create_entity {
                    name = "fire-flame",
                    position = { entity.position.x - 1, entity.position.y - 1 },
                    initial_ground_flame_count = 5
                }
            end
        end
    end
end
local heat_extractor = {}
heat_extractor.events = {
    [e.on_built_entity] = on_entity_created,
    [e.on_robot_built_entity] = on_entity_created,
    [e.script_raised_built] = on_entity_created,
    [e.script_raised_revive] = on_entity_created,
    [e.on_entity_died] = on_removed_entity,
    [e.on_robot_mined_entity] = on_removed_entity,
    [e.on_player_mined_entity] = on_removed_entity,
    [e.script_raised_destroy] = on_removed_entity,
    [e.on_script_trigger_effect] = self_burn
}


return heat_extractor
