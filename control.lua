local e = defines.events
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
            local platform=force.create_space_platform{name="home",planet="mothership",starter_pack="mothership-pack"} 
            platform.apply_starter_pack()
            game.planets["mothership"].associate_surface(platform.surface)
        end
        storage["platform"]=game.planets["mothership"].surface.platform
    end
    local planets={}
    local random_packs={"1","2","3","4",'5',"6","7","8","9"}
    local random_pack_count = #random_packs
    for name,planet in pairs(game.planets) do
        if name~="nauvis" and name~="mothership" then
            table.insert(planets,name)
            if random_pack_count>0 then
                random_pack_count=random_pack_count-1
            else table.insert(random_packs,"normal")
            end
        end
    end
    storage["planets"]=planets
    storage["random_pack"]=random_packs
    game.forces.player.unlock_space_location("asteroid-belt-inner")
    
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
    
    player.insert({name="asteroid-collector",count=4})
    player.insert({name="solar-panel",count=4})
    player.insert({name="space-platform-foundation",count=100})
    if storage["platform"] then
        player.teleport({5,5},storage["platform"].surface)
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

                    local random_index
                    local starter_pack_name
                    if target_planet.name=="vulcanus" then
                        random_index=5--铸造厂
                        starter_pack_name="6-pack"
                    elseif target_planet.name=="fulgora" then
                        random_index=9--雷星
                        starter_pack_name="9-pack"
                    else
                        random_index=event.tick%(#storage["random_pack"])+1--random
                        starter_pack_name=storage["random_pack"][random_index].."-pack"
                    end
                    
                    table.remove(storage["random_pack"],random_index)
                    local target_platform=platform.force.create_space_platform{name=target_planet.name,planet="nauvis",starter_pack=starter_pack_name}
                    target_platform.apply_starter_pack()
                    target_planet.associate_surface(target_platform.surface)
                    target_planet.surface.always_day=true
                    if starter_pack_name.name=="6-pack" then
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
            else i=i+1
            end
        end 
    end
end)

script.on_event(e.on_lua_shortcut,function (event)
    if event.prototype_name=="launch-rocket" then
        local player=game.players[event.player_index]
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
    if not player.character then
        player.leave_space_platform()
        player.teleport(player.physical_surface.find_non_colliding_position("character",{0,0},6,0.1))
        player.create_character()
        player.set_controller{type=defines.controllers.character}
    end
end)