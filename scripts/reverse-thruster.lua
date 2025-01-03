local e = defines.events


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
            force = entity.force
        }                                                                                              --把真正的推进器放下来
        local reverse_thrusters = storage["reverse_thrusters_position"] or {}
        table.insert(reverse_thrusters, { entity.position.x, entity.position.y, entity.surface.name }) --x,y,表面名字
        storage["reverse_thrusters_position"] = reverse_thrusters
    end
end
local on_removed_entity = function(event)
    if event.entity and event.entity.valid and event.entity.surface
        and event.entity.name == "reverse-thruster-skin" then
        local entity = event.entity
        local tank = entity.surface.find_entity("reverse-thruster-soul", entity.position)
        if tank then tank.destroy() end
        for i, position in pairs(storage["reverse_thrusters_position"]) do
            if position[1] == entity.position[1] and
                position[2] == entity.position[2] and
                position[3] == entity.surface.name
            then
                storage["reverse_thrusters_position"][i] = nil
                break
            end
        end
    end
end
local on_tick = function(event)
    local surface = game.planets.mothership.surface
    if not surface or not surface.valid then return end
    if not storage["reverse_thrusters_position"] then return end
    for i, position in pairs(storage["reverse_thrusters_position"]) do
        local surface = game.surfaces[position[3]]
        if surface and surface.valid then
            local soul = surface.find_entity("reverse-thruster-soul", { position[1], position[2] })
            local skin = surface.find_entity("reverse-thruster-skin", { position[1], position[2] })
            if soul and soul.valid then
                local fuel = skin.get_fluid(1)
                if fuel then soul.set_fluid(1, { name = "thruster-fuel", amount = fuel.amount }) end
                local oxide = skin.get_fluid(2)
                if oxide then soul.set_fluid(2, { name = "thruster-oxidizer", amount = oxide.amount }) end
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
