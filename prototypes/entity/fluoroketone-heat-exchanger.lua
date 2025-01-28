--目标温度，与蒸汽机上线温度，决定了他们的能耗和产能
-- data.raw.boiler["heat-exchanger"].target_temperature=789
-- data.raw.generator["steam-turbine"].maximum_temperature=987 fluid_usage_per_tick 每tick消耗多少目标流体，消耗后直接消失
--使用制作机加固定配方来充当boiler，否则会莫名其妙产生过多的氟酮
local util=require("util")--游戏自带的util
local utils=require("utils")--自己的util，很难绷得住
utils.add_recipe_item_group("fluoroketone-heat-exchanger")
local f_heat_exchanger = table.deepcopy(data.raw.boiler["heat-exchanger"])
f_heat_exchanger.type = "assembling-machine"
f_heat_exchanger.name = "fluoroketone-heat-exchanger"
f_heat_exchanger.icon = "__spaceplatform-block__/graphics/icons/fluoroketone-heat-exchanger.png"
f_heat_exchanger.minable={mining_time = 0.2, result ="fluoroketone-heat-exchanger"}
f_heat_exchanger.fixed_recipe = "fluoroketone-heating"
f_heat_exchanger.energy_usage = "10MW"
f_heat_exchanger.crafting_speed = 1
f_heat_exchanger.crafting_categories = { "fluoroketone-heat-exchanger" }
f_heat_exchanger.fluid_boxes = { f_heat_exchanger.fluid_box, f_heat_exchanger.output_fluid_box }
f_heat_exchanger.graphics_set = {
    animation = {
        north = {
            layers =
            {
                {
                    filename = "__spaceplatform-block__/graphics/entity/fluoroketone-heat-exchanger/heatex-N-idle.png",
                    priority = "extra-high",
                    width = 269,
                    height = 221,
                    shift = util.by_pixel(-1.25, 5.25),
                    scale = 0.5
                },
                {
                    filename = "__base__/graphics/entity/boiler/boiler-N-shadow.png",
                    priority = "extra-high",
                    width = 274,
                    height = 164,
                    scale = 0.5,
                    shift = util.by_pixel(20.5, 9),
                    draw_as_shadow = true
                }
            }
        },
        east = {
            layers =
            {
                {
                    filename = "__spaceplatform-block__/graphics/entity/fluoroketone-heat-exchanger/heatex-E-idle.png",
                    priority = "extra-high",
                    width = 211,
                    height = 301,
                    shift = util.by_pixel(-1.75, 1.25),
                    scale = 0.5
                },
                {
                    filename = "__base__/graphics/entity/boiler/boiler-E-shadow.png",
                    priority = "extra-high",
                    width = 184,
                    height = 194,
                    scale = 0.5,
                    shift = util.by_pixel(30, 9.5),
                    draw_as_shadow = true
                }
            }
        },
        south = {
            layers =
            {
                {
                    filename = "__spaceplatform-block__/graphics/entity/fluoroketone-heat-exchanger/heatex-S-idle.png",
                    priority = "extra-high",
                    width = 260,
                    height = 201,
                    shift = util.by_pixel(4, 10.75),
                    scale = 0.5
                },
                {
                    filename = "__base__/graphics/entity/boiler/boiler-S-shadow.png",
                    priority = "extra-high",
                    width = 311,
                    height = 131,
                    scale = 0.5,
                    shift = util.by_pixel(29.75, 15.75),
                    draw_as_shadow = true
                }
            }
        },
        west = {
            layers =
            {
                {
                    filename = "__spaceplatform-block__/graphics/entity/fluoroketone-heat-exchanger/heatex-W-idle.png",
                    priority = "extra-high",
                    width = 196,
                    height = 273,
                    shift = util.by_pixel(1.5, 7.75),
                    scale = 0.5
                },
                {
                    filename = "__base__/graphics/entity/boiler/boiler-W-shadow.png",
                    priority = "extra-high",
                    width = 206,
                    height = 218,
                    scale = 0.5,
                    shift = util.by_pixel(19.5, 6.5),
                    draw_as_shadow = true
                }
            }
        }
    }
}
data:extend {
    f_heat_exchanger
}



local gen = table.deepcopy(data.raw.generator["steam-turbine"])
gen.fluid_box.filter = "fluoroketone-cold"
gen.fluid_box.minimum_temperature = -180
gen.name = "f-gen"
data:extend { gen }

local fusion_gen = table.deepcopy(data.raw["fusion-generator"]["fusion-generator"])
fusion_gen.input_fluid_box.filter = "fluoroketone-cold"
fusion_gen.input_fluid_box.pipe_connections =
{
    { flow_direction = "input",  direction = defines.direction.south, position = { -1, 2 } },
    { flow_direction = "input",  direction = defines.direction.south, position = { 1, 2 } },
    { flow_direction = "output", direction = defines.direction.north, position = { 0, -2 } },
    { flow_direction = "output", direction = defines.direction.west,  position = { -1, 0 } },
    { flow_direction = "output", direction = defines.direction.east,  position = { 1, 0 } },
    { flow_direction = "output", direction = defines.direction.west,  position = { -1, -1 } },
    { flow_direction = "output", direction = defines.direction.east,  position = { 1, -1 } },
}
fusion_gen.name = "fusion-gen"
data:extend { fusion_gen }
