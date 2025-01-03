local e = defines.events
local self_burn=function(event)
    local surface = game.surfaces[event.surface_index]
    if event.effect_id == "sol-fire-sticker" then
        for name, player in pairs(game.players) do
            local character = player.character
            if character and player.physical_surface.name == "sol" then
                surface.create_entity {
                    name = "fire-sticker",
                    position = character.position,
                    target = character,
                    cause = game.forces[3]
                }
            end
        end
    end
end
local sol={}
sol.events={
    [e.on_script_trigger_effect] = self_burn
}
return sol
