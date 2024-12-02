local e = defines.events
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
    local force =game.forces.player
    force.unlock_space_platforms()
	local platform=force.create_space_platform{name="home",planet="mothership",starter_pack="mothership-pack"} 
	platform.apply_starter_pack()

    game.planets["mothership"].associate_surface(platform.surface)
    storage["planet_index"]=1
    storage["platform"]=platform
    storage["delete_platform"]={}
    
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
end)


script.on_event(e.on_player_created, function(event)
    local player = game.get_player(event.player_index) --[[@as LuaPlayer]]
    player.insert({name="asteroid-collector",count=4})
    player.insert({name="solar-panel",count=4})
    player.insert({name="crusher",count=3})
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
                    game.print("发射了探空启动包，但是没有新的发现")
                else
                    local target_planet=game.planets[planets[storage["planet_index"]]]
                    platform.force.unlock_space_location(target_planet.name)

                    local random_index
                    if target_planet.name=="vulcanus" then
                        random_index=5--铸造厂
                    elseif target_planet.name=="fulgora" then
                        random_index=9--雷星
                    else random_index=event.tick%(#storage["random_pack"])+1--random
                    end
                    local starter_pack_name=storage["random_pack"][random_index].."-pack"
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
                    
                    game.print("发现了一个新的区域")
                    storage["planet_index"]=storage["planet_index"]+1
                end
                platform.destroy(1)
                return
            else i=i+1
            end
        end 
    end
end)