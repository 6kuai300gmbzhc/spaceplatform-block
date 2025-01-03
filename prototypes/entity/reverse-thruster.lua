local utils = require("utils")
--反推火箭
--一个贴图反过来画的火箭，负责接受流体和显示UI，和普通的火箭一样
--套一个透明火箭，负责产生两倍的反冲力量
local reverse_thruster_skin = table.deepcopy(data.raw.thruster.thruster)
reverse_thruster_skin.minable = {
    mining_time = 0.1,
    result = "reverse-thruster"
}
reverse_thruster_skin.name = "reverse-thruster-skin"
reverse_thruster_skin.oxidizer_fluid_box.pipe_connections[1].position = { 1.5, 0 }
reverse_thruster_skin.oxidizer_fluid_box.pipe_connections[2].position = { -1.5, 2 }
reverse_thruster_skin.fuel_fluid_box.pipe_connections[1].position = { -1.5, 0 }
reverse_thruster_skin.fuel_fluid_box.pipe_connections[2].position = { 1.5, 2 }
reverse_thruster_skin.selection_box = {
    {
        -2,
        -5.5
    },
    {
        2,
        2.5
    }
}
local graphics_set = reverse_thruster_skin.graphics_set
graphics_set.animation.filenames = {
    "__spaceplatform-block__/graphics/entity/reverse-thruster/thruster-1.png",
    "__spaceplatform-block__/graphics/entity/reverse-thruster/thruster-2.png"
}
graphics_set.animation.shift = {
    0.046875,
    -1.78125
}
graphics_set.flame_effect = nil --把火焰关了
utils.revers_vector(graphics_set.flame_position)
-- graphics_set.flame_half_height=
graphics_set.integration_patch.filename = "__spaceplatform-block__/graphics/entity/reverse-thruster/thruster-bckg.png"
graphics_set.integration_patch.shift = {
    0.0625,
    -0.734375
}

graphics_set.working_visualisations = {
    {
        always_draw = true,
        animation = {
            filename = "__spaceplatform-block__/graphics/entity/reverse-thruster/thruster-pipe-connection-1.png",
            height = 832,
            scale = 0.5,
            shift = {
                0,
                2.96875 - 1.78125
            },
            width = 384
        },
        enabled_by_name = true,
        name = "pipe-1"
    },
    {
        always_draw = true,
        animation = {
            filename = "__spaceplatform-block__/graphics/entity/reverse-thruster/thruster-pipe-connection-2.png",
            height = 832,
            scale = 0.5,
            shift = {
                0,
                3 - 1.78125
            },
            width = 384
        },
        enabled_by_name = true,
        name = "pipe-2"
    },
    {
        always_draw = true,
        animation = {
            filename = "__spaceplatform-block__/graphics/entity/reverse-thruster/thruster-pipe-connection-3.png",
            height = 832,
            scale = 0.5,
            shift = {
                0,
                3 - 1.78125
            },
            width = 384
        },
        enabled_by_name = true,
        name = "pipe-3"
    },
    {
        always_draw = true,
        animation = {
            filename = "__spaceplatform-block__/graphics/entity/reverse-thruster/thruster-pipe-connection-4.png",
            height = 832,
            scale = 0.5,
            shift = {
                0,
                2.96875 - 1.78125
            },
            width = 384
        },
        enabled_by_name = true,
        name = "pipe-4"
    },
    {
        animation = {
            animation_speed = 0.5,
            blend_mode = "additive",
            draw_as_glow = true,
            filenames = {
                "__spaceplatform-block__/graphics/entity/reverse-thruster/thruster-light-1.png",
                "__spaceplatform-block__/graphics/entity/reverse-thruster/thruster-light-2.png"
            },
            frame_count = 64,
            height = 832,
            line_length = 8,
            lines_per_file = 4,
            scale = 0.5,
            shift = {
                0,
                -3
            },
            width = 384
        },
        fadeout = true
    }
}
local plume = reverse_thruster_skin.plumes
plume.max_y_offset = 4
plume.min_y_offset = 0
for i, stateless_visualisation in pairs(plume.stateless_visualisations) do
    utils.revers_vector(stateless_visualisation.offset_y)
    utils.revers_vector(stateless_visualisation.speed_y)
end
local tile_buildability_rules = reverse_thruster_skin.tile_buildability_rules
tile_buildability_rules[1].area = {
    {
        -1.8,
        -5.2999999999999998

    },
    {
        1.8,
        -2.2999999999999998
    }
}
tile_buildability_rules[2].area = {
    {
        -1.8,
        -90.299999999999997
    },
    {
        1.8,
        -2.7000000000000002
    }
}
reverse_thruster_skin.hidden_in_factoriopedia=true
data:extend { reverse_thruster_skin }

--这里是真正起作用的推进器，设置效率为两倍
local reverse_thruster_soul = table.deepcopy(data.raw.thruster.thruster)
local change = {
    type = "thruster",
    name = "reverse-thruster-soul",
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
    min_performance = { effectivity = 2, fluid_usage = -0.1, fluid_volume = 0.1 },
    max_performance = { effectivity = 1, fluid_usage = -2, fluid_volume = 0.8 },
    collision_box = { { -1, -1 }, { 1, 1 } },
    graphics_set = utils.blank,
    selection_box = { { -1, -1 }, { 1, 1 } },
    fuel_fluid_box = { volume = 1000, filter = "thruster-fuel", pipe_connections = { { direction = defines.direction.east, position = { 1, 0 } } } },
    oxidizer_fluid_box = { volume = 1000, filter = "thruster-oxidizer", pipe_connections = { { direction = defines.direction.west, position = { -1, 0 } } } }
}
for name, value in pairs(change) do
    reverse_thruster_soul[name] = value
end
reverse_thruster_soul.minable = nil
reverse_thruster_soul.plumes = nil
reverse_thruster_soul.placeable_position_visualization = nil
reverse_thruster_soul.working_sound = nil
reverse_thruster_soul.tile_buildability_rules = nil
--飞到死模式塞到枢纽里的火箭
data:extend {
    reverse_thruster_soul
}
