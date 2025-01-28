local utils = require("utils")
local util = require("util")
--添加一个烧冰出蒸汽的锅炉
--ice-burner，消耗三种陨石直接出蒸汽（氧化剂+推进剂产热，很合理）
utils.add_recipe_item_group("asteroid-boiler")
local boiler = table.deepcopy(data.raw.boiler.boiler)
boiler.type = "assembling-machine"
boiler.name = "asteroid-boiler"
boiler.icon = "__spaceplatform-block__/graphics/icons/asteroid-boiler.png"
boiler.minable = { mining_time = 0.2, result = "asteroid-boiler" }
boiler.energy_usage = "100kW"
boiler.energy_source = {
    type = "electric",
    usage_priority = "primary-input"
}
boiler.crafting_speed = 1
boiler.crafting_categories = { "asteroid-boiler" }
boiler.fluid_boxes_off_when_no_fluid_recipe = false
--三个方向都出蒸汽
boiler.fluid_boxes = {
    {
        volume = 200,
        pipe_covers = pipecoverspictures(),
        pipe_connections =
        {
            { flow_direction = "input-output", direction = defines.direction.west,  position = { -1, 0.5 } },
            { flow_direction = "input-output", direction = defines.direction.east,  position = { 1, 0.5 } },
        },
        production_type = "input",
        filter="water"
    },
    {
        volume = 200,
        pipe_covers = pipecoverspictures(),
        pipe_connections =
        {
            { flow_direction = "output", direction = defines.direction.north, position = { 0, -0.5 } }
        },
        production_type = "output",
        filter="steam"
    }
}
boiler.graphics_set = {
    animation = {
        north = {
            layers =
            {
                {
                    filename = "__spaceplatform-block__/graphics/entity/asteroid-boiler/boiler-N-idle.png",
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
                    filename = "__spaceplatform-block__/graphics/entity/asteroid-boiler/boiler-E-idle.png",
                    priority = "extra-high",
                    width = 216,
                    height = 301,
                    shift = util.by_pixel(-3, 1.25),
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
                    filename = "__spaceplatform-block__/graphics/entity/asteroid-boiler/boiler-S-idle.png",
                    priority = "extra-high",
                    width = 260,
                    height = 192,
                    shift = util.by_pixel(4, 13),
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
                    filename = "__spaceplatform-block__/graphics/entity/asteroid-boiler/boiler-W-idle.png",
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
data:extend { boiler }
