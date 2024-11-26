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
end)

-- script.on_configuration_changed(correct_space_locations)
-- script.on_event(e.on_technology_effects_reset, correct_space_locations)

script.on_event(e.on_player_created, function(event)
    local player = game.get_player(event.player_index) --[[@as LuaPlayer]]
    if storage["platform"] then
        player.teleport({5,5},storage["platform"].surface)
        local nauvis = game.get_surface("nauvis") --[[@as LuaSurface]]
        nauvis.clear()
    end
    -- local gui = player.gui.top
    -- local button = gui.add({type="button", name="leave_space_platform",caption={"description.leave-space-platform"}})
end)


local planets_data=require("planets_data")
local planets=planets_data.getplanets()
script.on_event(e.on_space_platform_changed_state,function(event)
    local platform=event.platform
    game.print(platform.name)
    game.print(event.old_state)
    if event.old_state==0 then
        if platform.starter_pack and platform.starter_pack.name.name=="mothership-pack" then
            table.insert(storage["delete_platform"],platform.name)
        end
    elseif event.old_state==1 then
        local storage_delete_platform=storage["delete_platform"]
        for i = #storage_delete_platform, 1, -1 do
            print(storage_delete_platform[i])
            if storage_delete_platform[i]==platform.name then
                table.remove(storage_delete_platform,i)
                if storage["planet_index"]>#planets then
                    local target_platform=platform.force.create_space_platform{name=platform.name,planet="mothership",starter_pack="space-platform-starter-pack"} 
                    target_platform.apply_starter_pack()
                    game.print("MAN!")
                else
                    local target_planet=game.planets[planets[storage["planet_index"]]]
                    local target_platform=platform.force.create_space_platform{name=planets[storage["planet_index"]],planet=planets[storage["planet_index"]],starter_pack="mothership-pack"}
                    target_platform.apply_starter_pack()
                    target_planet.associate_surface(target_platform.surface)
                    platform.force.unlock_space_location(planets[storage["planet_index"]])
                    target_planet.surface.freeze_daytime=true
                    --target_platform.destroy(1)
                    game.print("create "..target_planet.name)
                    storage["planet_index"]=storage["planet_index"]+1
                end
                platform.destroy(1)
                return
            else i=i+1
            end
        end 
    end
end)
-- script.on_event(e.on_gui_click,function (event)
--     local element=event.element
--     if not (element and element.valid) then return end
--     local player=game.players[element.player_index]
--     player.leave_space_platform()
-- end)