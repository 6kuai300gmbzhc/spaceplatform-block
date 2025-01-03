local utils=require("utils")
local fly_to_die_thruster = table.deepcopy(data.raw.thruster.thruster)
local change = {
  type = "thruster",
  name = "fly-to-die-thruster",
  hidden_in_factoriopedia = true,
  hidden = true,
  flags = {
    "not-rotatable",
    "placeable-neutral",
    "placeable-player",
    "placeable-enemy",
    "not-on-map",
    "hide-alt-info",
    "not-blueprintable",
    "not-deconstructable",
    "no-copy-paste",
    "not-selectable-in-game"
  },
  selectable_in_game = false,
  min_performance = { effectivity = 0.5, fluid_usage = 0.1, fluid_volume = 0 },
  max_performance = { effectivity = settings.startup["fly-to-die-speed"].value, fluid_usage = 10, fluid_volume = 1 },
  collision_box = { { -1, -1 }, { 1, 1 } },
  graphics_set = utils.blank,
  selection_box = { { -1, -1 }, { 1, 1 } },
  fuel_fluid_box = { volume = 10000, filter = "thruster-fuel", pipe_connections = { { direction = defines.direction.east, position = { 1, 0 } } } },
  oxidizer_fluid_box = { volume = 10000, filter = "thruster-oxidizer", pipe_connections = { { direction = defines.direction.west, position = { -1, 0 } } } }
}
for name, value in pairs(change) do
  fly_to_die_thruster[name] = value
end
fly_to_die_thruster.minable = nil
fly_to_die_thruster.plumes = nil
fly_to_die_thruster.placeable_position_visualization = nil
fly_to_die_thruster.working_sound = nil
fly_to_die_thruster.tile_buildability_rules = nil
--飞到死模式塞到枢纽里的火箭
data:extend {
  fly_to_die_thruster
}
