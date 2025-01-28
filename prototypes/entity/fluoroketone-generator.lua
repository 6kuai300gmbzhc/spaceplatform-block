--用聚变发电机来实现这个发电机，因为输入和输出总是1：1的关系
require("__base__/prototypes/entity/pipecovers.lua")
local fluoroketone_generator = table.deepcopy(data.raw["fusion-generator"]["fusion-generator"])
fluoroketone_generator.name = "fluoroketone-generator"
fluoroketone_generator.factoriopedia_description = nil
fluoroketone_generator.icon = "__spaceplatform-block__/graphics/icons/fluoroketone-generator.png"
fluoroketone_generator.minable = { mining_time = 0.2, result = "fluoroketone-generator" }
fluoroketone_generator.corpse = nil
fluoroketone_generator.collision_box = { { -2.2, -2.2 }, { 2.2, 2.2 } }
fluoroketone_generator.selection_box = { { -2.5, -2.5 }, { 2.5, 2.5 } }
fluoroketone_generator.fast_replaceable_group = nil
fluoroketone_generator.flags = { "placeable-neutral", "placeable-player", "player-creation", "not-rotatable" } --不能转，很重要，省去我画贴图
fluoroketone_generator.energy_source.output_flow_limit = "60MW"--每秒20流体是10MW
fluoroketone_generator.max_fluid_usage = 120/second                                                --后面改,和产热器3：2，6个换热器带一个发电机
fluoroketone_generator.energy_source.usage_priority = "primary-output"                                         --最高优先
local animation = {
    animation = {
        layers ={
            {
                filenames = {
                    "__spaceplatform-block__/graphics/entity/fluoroketone-generator/fluoroketone-generator-animation-1.png",
                    "__spaceplatform-block__/graphics/entity/fluoroketone-generator/fluoroketone-generator-animation-2.png"
                },
                frame_count = 80,
                lines_per_file = 5,
                height = 410,
                line_length = 8,
                priority = "high",
                scale = 0.5,
                shift = {
                    0,
                    -1
                },
                width = 330,
                animation_speed = 0.3
            },
            {
                draw_as_shadow = true,
                filename =
                "__spaceplatform-block__/graphics/entity/fluoroketone-generator/fluoroketone-generator-shadow.png",
                frame_count = 1,
                height = 334,
                line_length = 1,
                priority = "high",
                repeat_count = 80,
                lines_per_file = 1,
                scale = 0.5,
                shift = {
                    1.265625,
                    0.8625-1
                },
                width = 480
            }
        }
    },
    working_light = {
        layers = {
            {
                filenames = {
                    "__spaceplatform-block__/graphics/entity/fluoroketone-generator/fluoroketone-generator-emission-1.png",
                    "__spaceplatform-block__/graphics/entity/fluoroketone-generator/fluoroketone-generator-emission-2.png"
                },
                frame_count = 80,
                lines_per_file = 5,
                height = 410,
                line_length = 8,
                priority = "high",
                scale = 0.5,
                shift = {
                    0,
                    -1
                },
                width = 330,
                animation_speed = 0.3,
                draw_as_glow = true,
                blend_mode = "additive"
            }
        }
    },
    fluid_input_graphics = { --下的放在这里
        {
            sprite = {
                layers = {
                    {
                        filename = "__spaceplatform-block__/graphics/entity/fluoroketone-generator/pipe-down.png",
                        height = 122,
                        width = 330,
                        line_length = 1,
                        scale=0.5,
                        shift={-0.0625,2}
                    }
                }
            }
        }
    }
}
fluoroketone_generator.graphics_set = {
    north_graphics_set = animation,
    east_graphics_set = animation,
    south_graphics_set = animation,
    west_graphics_set = animation,

}
fluoroketone_generator.input_fluid_box = {
    volume = 200,
    filter = "fluoroketone-hot",
    pipe_connections = {
        {
            flow_direction = "input",
            direction = defines.direction.south,
            position = { 0, 2 } --下
        }
    }
}
fluoroketone_generator.output_fluid_box = {
    volume = 200,
    filter = "fluoroketone-cold",
    always_draw_covers = true,
    pipe_covers = pipecoverspictures(),
    pipe_connections = {
        {
            flow_direction = "output",
            direction = defines.direction.north,
            position = { 0, -2 } --上
        }
    }
}
data:extend { fluoroketone_generator }
