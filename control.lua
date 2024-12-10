local e = defines.events
local function cal_distance(planet)
    local position=planet.prototype.position
    return position.x*position.x+position.y*position.y
end
local function load_storage_data()
    if not storage["delete_platform"] then
        storage["delete_platform"]={}
    end
    if not storage["planet_index"] then
        storage["planet_index"]=1
    end
    if not storage["platform"] then
        if not game.planets["mothership"].surface then
            local force =game.forces.player
            force.unlock_space_platforms()
            local platform=force.create_space_platform{name="home",planet="sol",starter_pack="mothership-pack"}
            platform.apply_starter_pack()
            game.planets["mothership"].associate_surface(platform.surface)
        end
        storage["platform"]=game.planets["mothership"].surface.platform
    end
    if not game.planets.sol.surface then
        game.forces.player.unlock_space_location("sol")
        local sol_surface=game.planets.sol.create_surface()
        game.forces.player.chart(sol_surface,{{x = -200, y = -200}, {x = 200, y = 200}})
        sol_surface.create_entity{name="fulgoran-ruin-attractor",position={-3,-3},force="neutral"}--雷神引雷塔
        sol_surface.create_entity{name="biter-spawner",position={0,0},force="enemy"}
        game.forces.enemy.set_evolution_factor(1,sol_surface)
    end
    local planets={}--按距离排序
    for name,planet in pairs(game.planets) do
        if name~="nauvis" and name~="mothership" and name~="sol" then
            local inserted=false
            local distance=cal_distance(planet)
            for i =  1,#planets,1 do
                if cal_distance(game.planets[planets[i]])>=distance then
                    table.insert(planets,i,name)
                    inserted=true
                    break
                end
            end
            if not inserted then table.insert(planets,name) end
        end
    end
    storage["planets"]=planets
    if not storage["first-join"] then storage["first-join"]=true end
    for i,name in pairs(planets) do log(name.." "..cal_distance(game.planets[name])) end
end
script.on_init(function()
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
    
end)
script.on_configuration_changed(function ()--更新一些mod更新没补上的科技
    if game.forces.player.technologies["rocket-silo"].researched then
        game.forces.player.recipes["rocket-silo"].enabled=true
    end
    if game.forces.player.technologies["space-platform"].researched then
        game.forces.player.recipes["space-platform-hub"].enabled=true
    end
    load_storage_data()
    
end)

script.on_event(e.on_player_created, function(event)
    local player = game.get_player(event.player_index) --[[@as LuaPlayer]]
    
    if storage["first-join"] then
        player.insert({name="asteroid-collector",count=4})
        player.insert({name="solar-panel",count=4})
        player.insert({name="space-platform-foundation",count=100})
        storage["first-join"]=false
    else
        player.insert({name="space-platform-foundation",count=100})
    end
    if storage["platform"] then
        player.teleport(storage["platform"].surface.find_non_colliding_position("character",{0,0},6,0.1),storage["platform"].surface)
        local nauvis = game.get_surface("nauvis") --[[@as LuaSurface]]
        nauvis.clear()
    end
end)

script.on_event(e.on_player_respawned, function(event)
    local player = game.get_player(event.player_index) --[[@as LuaPlayer]]
    if storage["platform"] then
        player.teleport(storage["platform"].surface.find_non_colliding_position("character",{0,0},6,0.1),storage["platform"].surface)
        local nauvis = game.get_surface("nauvis") --[[@as LuaSurface]]
        nauvis.clear()
    end
end)

local support_planet={
    vulcanus=true,
    nauvisorbit=true,
    gleba=true,
    fulgora=true,
    aquilo=true
}
script.on_event(e.on_space_platform_changed_state,function(event)
    local platform=event.platform
    -- game.print(platform.name)
    -- game.print(event.old_state)
    if event.old_state==0 then
        if platform.starter_pack and platform.starter_pack.name.name=="mothership-pack" then
            table.insert(storage["delete_platform"],platform.name)
        end
    elseif event.old_state==1 then
        local storage_delete_platform=storage["delete_platform"]
        for i = #storage_delete_platform, 1, -1 do
            if storage_delete_platform[i]==platform.name then
                table.remove(storage_delete_platform,i)
                local planets=storage["planets"]
                if storage["planet_index"]>#planets then
                    game.print({"description.no-planet-found"})
                else
                    local target_planet=game.planets[planets[storage["planet_index"]]]
                    platform.force.unlock_space_location(target_planet.name)

                    
                    local starter_pack_name=target_planet.name.."-pack"
                    if not support_planet[target_planet.name]  then
                        starter_pack_name="normal-pack"
                    end

                    local target_platform=platform.force.create_space_platform{name=target_planet.name,planet="sol",starter_pack=starter_pack_name}
                    target_platform.apply_starter_pack()
                    target_planet.associate_surface(target_platform.surface)
                    target_planet.surface.always_day=true
                    if starter_pack_name.name=="nauvisorbit-pack" then
                        local crash_ship=target_planet.surface.find_entity("crash-site-spaceship",{0,0})
                        if crash_ship then
                            crash_ship.get_inventory().insert({name="thruster",count=1,quality="rare"})
                            crash_ship.get_inventory().insert({name="cargo-bay",count=1,quality="uncommon"})
                        end
                    end
                    
                    game.print({"description.new-planets-found"})
                    storage["planet_index"]=storage["planet_index"]+1
                end
                platform.destroy(1)
                return
            end
        end 
    end
end)

script.on_event(e.on_lua_shortcut,function (event)
    local player=game.players[event.player_index]
    if event.prototype_name=="launch-rocket" then
        if not player.force.technologies["rocket-silo"].researched then
            return
        end
        if player.gui.screen.create_platform then
            player.gui.screen.create_platform.destroy()
            return
        end
        local launch_planets={}
        local force=player.force
        for name,planet in pairs(game.planets) do
            if name~="nauvis" then 
                if force.is_space_location_unlocked(name) then
                    table.insert(launch_planets,name)
                end
            end
        end
        local create_platform=player.gui.screen.add{
            type = "frame",
            name = "create_platform",
            direction = "vertical",
            caption="   "
        }
        create_platform.auto_center = true
        player.opened = create_platform
        
        local launch_flow=create_platform.add{ type = "flow", direction = "vertical"}

        local select_planet=launch_flow.add{ type = "flow", direction = "vertical",name="select_planet"}
        select_planet.add { type = "label", caption = {"description.select-planet"} }
        local planet_dropdown =select_planet.add{ type = "drop-down",name="planet_dropdown"}
        planet_dropdown.items = launch_planets
        planet_dropdown.selected_index=1
        
        local select_starter_pack=launch_flow.add{ type = "flow", direction = "vertical",name="select_starter_pack"}
        select_starter_pack.add{ type = "label", caption = {"description.select-starter-pack"} }
        local starter_pack_dropdown =select_starter_pack.add{ type = "drop-down",name="starter_pack_dropdown"}
        starter_pack_dropdown.items = { "[item=mothership-pack]", "[item=space-platform-starter-pack]"}
        starter_pack_dropdown.selected_index=1
        launch_flow.add{type="button",caption={"description.create-platform"},style="confirm_button_without_tooltip",name="create_platform_button"}
    elseif event.prototype_name=="respawn" then
        if player.character and player.controller_type==defines.controllers.character then
            player.character.die(player.force, player.character)
        end
    end
end)
script.on_event(e.on_gui_click,function (event)
    local player=game.players[event.player_index]
    if event.element.name=="create_platform_button" then
        local launch_flow=event.element.parent
        local planet=launch_flow.select_planet.planet_dropdown.items[launch_flow.select_planet.planet_dropdown.selected_index]
        local pack=launch_flow.select_starter_pack.starter_pack_dropdown.items[launch_flow.select_starter_pack.starter_pack_dropdown.selected_index]
        pack=string.sub(pack, 7,-2)
        player.force.create_space_platform{name="platform",planet=planet,starter_pack=pack}
        launch_flow.parent.destroy()
    end
end)
script.on_event("leave_hub",function(event)
    local player=game.players[event.player_index]
    if player.controller_type==defines.controllers.remote and
       player.physical_controller_type==defines.controllers.character and
       player.physical_position.x==0 and
       player.physical_position.y==0
       then
        player.leave_space_platform()
        player.set_controller{type=player.physical_controller_type,character=player.character}
        player.teleport(player.physical_surface.find_non_colliding_position("character",{0,0},6,0.1))
    end
end)

script.on_event(e.on_chunk_charted,function (event)
    local surface=game.surfaces[event.surface_index]
    if surface.name=="sol" then
        local position=event.position
        if position.x<=5 and position.x>=-5 and position.y<=5 and position.y>=-5 then
            local tile={
                position = position,
                name = "foundation"
            }
            surface.set_tiles({tile})
        end
    end
end)