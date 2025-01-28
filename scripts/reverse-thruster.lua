local e = defines.events
local utils = require("script_utils")
local storage_name = "reverse_thrusters"
local on_entity_created = function(event)
    local entity
    if event.entity and event.entity.valid then
        entity = event.entity
    end
    if event.created_entity and event.created_entity.valid then
        entity = event.created_entity
    end
    if not entity then return end
    if entity.name == "reverse-thruster-skin" then
        entity.surface.create_entity {
            name = "reverse-thruster-soul",
            position = entity.position,
            direction = entity.direction,
            force = entity.force,
            quality = entity.quality
        } --把真正的推进器放下来
        utils.save_to_storage(storage_name, entity)
    end
end
local on_removed_entity = function(event)
    if event.entity and event.entity.valid and event.entity.surface
        and event.entity.name == "reverse-thruster-skin" then
        local entity = event.entity
        local soul = entity.surface.find_entities_filtered({
            position = entity.position,
            name = "reverse-thruster-soul"
        })
        if soul and soul[1] and soul[1].valid then soul[1].destroy() end
        utils.delete_storage_entity(storage_name, entity)
    end
end
local on_tick = function(event)
    local surface = game.planets.mothership.surface
    if not surface or not surface.valid then return end
    if not storage[storage_name] then return end
    for i, entity in pairs(storage[storage_name]) do
        local surface = entity.surface
        if surface and surface.valid then
            local soul = surface.find_entities_filtered({
                position = entity.position,
                name = "reverse-thruster-soul"
            })
            if soul and soul[1] and soul[1].valid then
                local fuel = entity.get_fluid(1)
                if fuel then soul[1].set_fluid(1, { name = "thruster-fuel", amount = fuel.amount }) end
                local oxide = entity.get_fluid(2)
                if oxide then soul[1].set_fluid(2, { name = "thruster-oxidizer", amount = oxide.amount }) end
            end
        end
    end
end
local reverse_thruster = {}
reverse_thruster.events = {
    [e.on_built_entity] = on_entity_created,
    [e.on_robot_built_entity] = on_entity_created,
    [e.script_raised_built] = on_entity_created,
    [e.script_raised_revive] = on_entity_created,
    [e.on_entity_died] = on_removed_entity,
    [e.on_robot_mined_entity] = on_removed_entity,
    [e.on_player_mined_entity] = on_removed_entity,
    [e.script_raised_destroy] = on_removed_entity,
    [e.on_tick] = on_tick
}


return reverse_thruster
