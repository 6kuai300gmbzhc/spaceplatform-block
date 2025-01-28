--就决定是你了，让你变成furnace，自动选择配方来加工方块
local utils = require("utils")
local pattern = {
    name = "arc-furnace",
    icon = "__spaceplatform-block__/graphics/icons/arc-furnace-icon.png",
    result_inventory_size=4,
    source_inventory_size=1,
    icon_size=64,
    crafting_speed = 10,
    crafting_categories={ "smelting", "metallurgy-or-assembling", "metallurgy-or-assembling", "crafting-with-fluid-or-metallurgy","cube" },
    energy_usage="10MW",
    module_slots = 8,
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    minable = { hardness = 0.2, mining_time = 1, result = "arc-furnace" },
    selection_box = { { -2.5, -2.5 }, { 2.5, 2.5 } },
    collision_box = { { -2.4, -2.4 }, { 2.4, 2.4 } },
    graphics_set = {
        animation = {
            layers = {
                {
                    filename = "__spaceplatform-block__/graphics/entity/arc-furnace/arc-furnace-hr-shadow.png",
                    priority = "high",
                    size = { 600, 400 },
                    shift = { 0, 0 },
                    scale = 0.5,
                    line_length = 1,
                    frame_count = 1,
                    repeat_count = 40,
                    draw_as_shadow = true,
                    animation_speed = 0.5,
                },
                {
                    filename = "__spaceplatform-block__/graphics/entity/arc-furnace/arc-furnace-hr-structure.png",
                    size = { 320, 320 },
                    shift = { 0, 0 },
                    scale = 0.5,
                    line_length = 1,
                    frame_count = 1,
                    repeat_count = 40,
                    animation_speed = 0.5,
                },
            },
        },
        working_visualisations = {
            {
                fadeout = true,
                secondary_draw_order = 1,
                animation = {
                    layers = {
                        {
                            filename =
                            "__spaceplatform-block__/graphics/entity/arc-furnace/arc-furnace-hr-animation-emission-1.png",
                            size = { 320, 320 },
                            shift = { 0, 0 },
                            scale = 0.5,
                            line_length = 8,
                            lines_per_file = 8,
                            frame_count = 40,
                            draw_as_glow = true,
                            blend_mode = "additive",
                            animation_speed = 0.5,
                        },
                    }
                },
            },
        },
        reset_animation_when_frozen = true
    },
    energy_source = {
        type = "heat",
        max_temperature = 1000,
        min_working_temperature = 500,
        specific_heat = "10MJ",
        max_transfer = "500MW",
        connections =
        {
            {
                position = { -2, -2 },
                direction = defines.direction.north
            },
            {
                position = { 2, -2 },
                direction = defines.direction.north
            },
            {
                position = { 2, -2 },
                direction = defines.direction.east
            },
            {
                position = { 2, 2 },
                direction = defines.direction.east
            },
            {
                position = { 2, 2 },
                direction = defines.direction.south
            },
            {
                position = { -2, 2 },
                direction = defines.direction.south
            },
            {
                position = { -2, 2 },
                direction = defines.direction.west
            },
            {
                position = { -2, -2 },
                direction = defines.direction.west
            }
        },
        heat_picture = {
            layers = {
                {
                    blend_mode = "additive",
                    filename = "__spaceplatform-block__/graphics/entity/arc-furnace/arc-furnace-glow.png",
                    height = 320,
                    line_length = 1,
                    scale = 0.5,
                    shift = { 0, 0 },
                    tint = {
                        0.5,
                        0.4,
                        0.3,
                        0.5
                    },
                    width = 320
                },
                {
                    blend_mode = "additive",
                    draw_as_light = true,
                    filename = "__spaceplatform-block__/graphics/entity/arc-furnace/arc-furnace-glow.png",
                    height = 320,
                    line_length = 1,
                    scale = 0.5,
                    shift = { 0, 0 },
                    tint = {
                        1,
                        1,
                        1,
                        1
                    },
                    width = 320
                }
            }
        }
    },
}
local arc_furnace = table.deepcopy(data.raw.furnace["electric-furnace"])
for name, value in pairs(pattern) do
    arc_furnace[name] = value
end
data:extend{arc_furnace}
