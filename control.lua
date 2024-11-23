local e = defines.events
local plat_form=nil

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
	plat_form=force.create_space_platform{name="home",planet="nauvis",starter_pack="space-platform-starter-pack"} 
	plat_form.apply_starter_pack()

    game.planets["mothership"].associate_surface(plat_form.surface)
end)

-- script.on_configuration_changed(correct_space_locations)
-- script.on_event(e.on_technology_effects_reset, correct_space_locations)

script.on_event(e.on_player_created, function(event)
    local player = game.get_player(event.player_index) --[[@as LuaPlayer]]
    if plat_form then
        player.enter_space_platform(plat_form)
    end
    local nauvis = game.get_surface("nauvis") --[[@as LuaSurface]]
    nauvis.clear()
end)