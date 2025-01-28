local handler = require("event_handler")


handler.add_lib(require("scripts.sol"))
handler.add_lib(require("scripts.reverse-thruster"))
handler.add_lib(require("scripts.heat-extractor"))
handler.add_libraries(require("scripts.generate-asteroid"))--有一堆
--这代码我自己看了都想笑
--这也太烂了
--总之是引用了人家自己写好的handler把下面这坨都给塞进去，来实现多触发什么的
local e = defines.events
local base_control = {}
local function cal_distance(planet)
    local position = planet.prototype.position
    return position.x * position.x + position.y * position.y
end
local function load_storage_data()
    if not storage["delete_platform"] then
        storage["delete_platform"] = {}
    end
    if not storage["platform"] then
        if not game.planets["mothership"].surface then
            local force = game.forces.player
            force.unlock_space_platforms()
            local platform = force.create_space_platform { name = "home", planet = "sol", starter_pack = "mothership-pack" }
            platform.apply_starter_pack()
            game.planets["mothership"].associate_surface(platform.surface)
            force.unlock_space_location("mothership")
        end
        storage["platform"] = game.planets["mothership"].surface.platform
    end
    if not game.planets.sol.surface then
        game.forces.player.unlock_space_location("sol")
        local sol_surface = game.planets.sol.create_surface()
        game.forces.player.chart(sol_surface, { { x = -200, y = -200 }, { x = 200, y = 200 } })
        sol_surface.create_entity { name = "fulgoran-ruin-attractor", position = { -3, -3 }, force = "neutral" } --雷神引雷塔
        sol_surface.create_entity { name = "biter-spawner", position = { 0, 0 }, force = "enemy" }
        game.forces.enemy.set_evolution_factor(1, sol_surface)
    end
    local planets = {} --按距离排序
    for name, planet in pairs(game.planets) do
        if name ~= "nauvis" and name ~= "mothership" and name ~= "sol" then
            local inserted = false
            local distance = cal_distance(planet)
            for i = 1, #planets, 1 do
                if cal_distance(game.planets[planets[i]]) >= distance then
                    table.insert(planets, i, name)
                    inserted = true
                    break
                end
            end
            if not inserted then table.insert(planets, name) end
        end
    end
    storage["planets"] = planets
    for i, name in pairs(planets) do log(name .. " " .. cal_distance(game.planets[name])) end

    if settings.startup["gamemode"].value == "fly-to-die" then
        --解锁所有space-location
        --给飞船设定航线
        for name, planet in pairs(game.planets) do
            if name ~= "nauvis" and name ~= "sol" and name ~= "mothership" then
                local location_name = name .. "-orbit"
                game.forces.player.unlock_space_location(location_name)
            end
        end
        game.forces.player.unlock_space_location("solar-system-edge")
        game.forces.player.unlock_space_location("shattered-planet")
        game.forces.player.lock_space_location("sol")
        local schedule = {
            current = 1,
            records = {
                {
                    station = "shattered-planet"
                }
            }
        }
        game.planets["mothership"].surface.platform.schedule = schedule
        game.planets["mothership"].surface.platform.paused = false
    end
end
base_control.on_init = function()
    if game.tick > 0 then
        storage.init = true
        return
    end

    if remote.interfaces.freeplay then
        storage.disable_crashsite = remote.call("freeplay", "get_disable_crashsite")

        remote.call("freeplay", "set_disable_crashsite", true)
        remote.call("freeplay", "set_skip_intro", true)
    end

    load_storage_data()
end
base_control.on_configuration_changed = function() --更新一些mod更新没补上的科技

    game.forces.player.unlock_space_location("sol")
    --重置科技
    for name, force in pairs(game.forces) do
        force.reset_recipes()
        for name, technology in pairs(force.technologies) do
            if technology.researched then
                technology.reload()
            end
        end
    end
    load_storage_data()
    for name, planet in pairs(game.planets) do
        if name ~= "sol" and name ~= "nauvis" and name ~= "mothership" and planet.surface then
            game.forces.player.unlock_space_location(name)
            planet.surface.set_property("pressure", 1)
            planet.surface.set_property("gravity", 0)
        end
    end
    game.planets["mothership"].surface.set_property("pressure", 0)
end
--如果玩家的物理身体在母星，则看一眼是不是母舰没了，没了就重新捏一个
local test_and_repair_ship = function(event)
    if not game.planets["mothership"].surface then
        --如果玩家不在，但是母舰没了
        local force = game.forces.player
        force.unlock_space_platforms()
        force.unlock_space_location("mothership")
        local platform = force.create_space_platform { name = "home", planet = "sol", starter_pack = "mothership-pack" }
        platform.apply_starter_pack()
        game.planets["mothership"].associate_surface(platform.surface)
        storage["platform"] = game.planets["mothership"].surface.platform
    end
end
local on_player_created = function(event)
    local player = game.get_player(event.player_index) --[[@as LuaPlayer]]

    player.insert({ name = "space-platform-foundation", count = 100 })
    player.insert({ name = "teslagun", count = 1 })
    player.insert({ name = "tesla-ammo", count = 25 })
    if storage["platform"] then
        player.teleport(storage["platform"].surface.find_non_colliding_position("character", { 0, 0 }, 6, 0.1),
            storage["platform"].surface)
    end
end

local function teleport_mothership(player) --[[@as LuaPlayer]]
    local position = storage["platform"].surface.find_non_colliding_position("character", { 0, 0 }, 10, 0.1)
    if not position then
        storage["platform"].surface.set_tiles({ { position = { 0, 0 }, name = "space-platform-foundation" }, { position = { 1, 0 }, name = "space-platform-foundation" }, { position = { 0, 1 }, name = "space-platform-foundation" }, { position = { 1, 1 }, name = "space-platform-foundation" } })
        position = { 0.5, 0.5 }
    end
    player.teleport(position, storage["platform"].surface)
end
local function handle_respawn(event)
    local player = game.get_player(event.player_index) --[[@as LuaPlayer]]
    if player.physical_surface.name == "nauvis" then
        --如果在太阳就传送回母舰防止死档
        test_and_repair_ship()
        --旧版本地板可能被挖走了
        teleport_mothership(player)
    end
end
local on_respawn_on_sol = function(event)
    local player = game.get_player(event.player_index) --[[@as LuaPlayer]]
    if player.physical_surface.name == "sol" then
        --如果在太阳就传送回母舰防止死档
        test_and_repair_ship()
        --旧版本地板可能被挖走了
        teleport_mothership(player)
    end
end
local support_planet = {
    vulcanus = true,
    nauvisorbit = true,
    gleba = true,
    fulgora = true,
    aquilo = true
}
local on_space_platform_changed_state = function(event)
    local platform = event.platform
    -- game.print(platform.name)
    -- game.print(event.old_state)
    if event.old_state == 0 then
        if platform.starter_pack and platform.starter_pack.name.name == "mothership-pack" then
            table.insert(storage["delete_platform"], platform.name)
        elseif platform.starter_pack and platform.space_location.name == "mothership" then
            --从母舰上发射的普通启动包，送到母舰停靠的位置上

            if game.planets["mothership"].surface and game.planets["mothership"].surface.valid then
                local mothership_platform = game.planets["mothership"].surface.platform
                local last_location = mothership_platform.space_location
                if last_location and (last_location.map_gen_settings) then --是星球
                    local real_platform = platform.force.create_space_platform { name = platform.name, planet = last_location, starter_pack = platform.starter_pack }
                    real_platform.apply_starter_pack()
                else
                    game.print({ "description.mothership-need-stop" })
                end
            end
            platform.destroy(1)
        end
    elseif event.old_state == 1 then
        local storage_delete_platform = storage["delete_platform"]
        for i = #storage_delete_platform, 1, -1 do
            if storage_delete_platform[i] == platform.name then
                table.remove(storage_delete_platform, i)
                local planets = storage["planets"]

                local target_planet = nil
                for j = 1, #planets, 1 do
                    if not game.planets[planets[j]].surface then
                        target_planet = game.planets[planets[j]]
                        break
                    end
                end

                if not target_planet then
                    game.print({ "description.no-planet-found" })
                else
                    platform.force.unlock_space_location(target_planet.name)


                    local starter_pack_name = target_planet.name .. "-pack"
                    if not support_planet[target_planet.name] then
                        starter_pack_name = "normal-pack"
                    end

                    local target_platform = platform.force.create_space_platform { name = target_planet.name, planet = "sol", starter_pack = starter_pack_name }
                    target_platform.apply_starter_pack()
                    target_planet.associate_surface(target_platform.surface)
                    target_planet.surface.always_day = true
                    if starter_pack_name.name == "nauvisorbit-pack" then
                        local crash_ship = target_planet.surface.find_entity("crash-site-spaceship", { 0, 0 })
                        if crash_ship then
                            crash_ship.get_inventory().insert({ name = "thruster", count = 1, quality = "rare" })
                            crash_ship.get_inventory().insert({ name = "cargo-bay", count = 1, quality = "uncommon" })
                        end
                    end

                    game.print({ "description.new-planets-found" })
                end
                platform.destroy(1)
                platform = nil
                return
            end
        end
    end
end

local on_lua_shortcut = function(event)
    local player = game.players[event.player_index]
    if event.prototype_name == "launch-rocket" then
        if not player.force.technologies["rocket-silo"].researched then
            return
        end
        if player.gui.screen.create_platform then
            player.gui.screen.create_platform.destroy()
            return
        end
        local launch_planets = {}
        local force = player.force
        for name, planet in pairs(game.planets) do
            if name ~= "nauvis" then
                if force.is_space_location_unlocked(name) then
                    table.insert(launch_planets, name)
                end
            end
        end
        local create_platform = player.gui.screen.add {
            type = "frame",
            name = "create_platform",
            direction = "vertical",
            caption = "   "
        }
        create_platform.auto_center = true
        player.opened = create_platform

        local launch_flow = create_platform.add { type = "flow", direction = "vertical" }

        local select_planet = launch_flow.add { type = "flow", direction = "vertical", name = "select_planet" }
        select_planet.add { type = "label", caption = { "description.select-planet" } }
        local planet_dropdown = select_planet.add { type = "drop-down", name = "planet_dropdown" }
        planet_dropdown.items = launch_planets
        planet_dropdown.selected_index = 1

        local select_starter_pack = launch_flow.add { type = "flow", direction = "vertical", name = "select_starter_pack" }
        select_starter_pack.add { type = "label", caption = { "description.select-starter-pack" } }
        local starter_pack_dropdown = select_starter_pack.add { type = "drop-down", name = "starter_pack_dropdown" }
        starter_pack_dropdown.items = { "[item=mothership-pack]", "[item=space-platform-starter-pack]" }
        starter_pack_dropdown.selected_index = 1
        launch_flow.add { type = "button", caption = { "description.create-platform" }, style = "confirm_button_without_tooltip", name = "create_platform_button" }
    elseif event.prototype_name == "respawn" then
        if player.character and player.controller_type == defines.controllers.character then
            player.character.die(player.force, player.character)
        end
    end
end
local on_gui_click = function(event)
    local player = game.players[event.player_index]
    if event.element.name == "create_platform_button" then
        local launch_flow = event.element.parent
        local planet = launch_flow.select_planet.planet_dropdown.items
            [launch_flow.select_planet.planet_dropdown.selected_index]
        local pack = launch_flow.select_starter_pack.starter_pack_dropdown.items
            [launch_flow.select_starter_pack.starter_pack_dropdown.selected_index]
        pack = string.sub(pack, 7, -2)
        player.force.create_space_platform { name = "platform", planet = planet, starter_pack = pack }
        launch_flow.parent.destroy()
    end
end
local on_chunk_charted = function(event)
    local surface = game.surfaces[event.surface_index]
    if surface.name == "sol" then
        local position = event.position
        if (position.x <= 5 and position.x >= -5 and position.y <= 5 and position.y >= -5)
            or (position.x <= 20 and position.x >= 10 and position.y <= 5 and position.y >= -5)
        then
            local tile = {
                position = position,
                name = "foundation"
            }
            surface.set_tiles({ tile })
        end
    end
end

local lock_location = function(event)
    for name, planet in pairs(game.planets) do
        if name ~= "nauvis" and name ~= "mothership" and name ~= "sol" then
            if game.forces.player.is_space_location_unlocked(name) and (not planet.surface or not planet.surface.valid) then
                game.forces.player.lock_space_location(name)
                -- game.print("LOCKED"..name)
            end
        end
    end
end

local fly_to_die_add_fuel = function(event)
    --飞到死模式给引擎加燃料
    if settings.startup["gamemode"].value == "fly-to-die" then
        if not game.planets["mothership"].surface or not game.planets["mothership"].surface.valid then return end
        local thruster = game.planets["mothership"].surface.find_entity("fly-to-die-thruster", { 0, 0 })
        local weight = game.planets["mothership"].surface.platform.weight / 1000
        if thruster then
            thruster.set_fluid(1, { name = "thruster-fuel", amount = weight })
            thruster.set_fluid(2, { name = "thruster-oxidizer", amount = weight })
        end
    end
end
local base_on_tick = function(event)
    fly_to_die_add_fuel(event)
    test_and_repair_ship(event)
    lock_location(event)
end

base_control.events = {
    [e.on_player_created] = on_player_created,
    [e.on_player_respawned] = on_respawn_on_sol,
    [e.on_player_changed_surface] = handle_respawn,
    [e.on_space_platform_changed_state] = on_space_platform_changed_state,
    [e.on_lua_shortcut] = on_lua_shortcut,
    [e.on_gui_click] = on_gui_click,
    ["leave_hub"] = leave_hub,
    [e.on_chunk_charted] = on_chunk_charted,
    [e.on_tick] = fly_to_die_add_fuel
}
base_control.on_nth_tick = {
    [10] = base_on_tick
}
handler.add_lib(base_control)
