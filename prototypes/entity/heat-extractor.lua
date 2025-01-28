--放在太阳上的，自动产热，高温起火
local heat_extractor = table.deepcopy(data.raw.reactor["nuclear-reactor"])
heat_extractor.name = "heat-extractor"
heat_extractor.icon = "__spaceplatform-block__/graphics/icons/heat-extractor-icon.png"
heat_extractor.minable = { mining_time = 0.5, result = "heat-extractor" }
heat_extractor.fast_replaceable_group = nil
heat_extractor.corpse = nil
heat_extractor.consumption = "40MW"
heat_extractor.neighbour_bonus = -0.24
heat_extractor.energy_source = { type = "void" }
heat_extractor.resistances={
    {
        type = "fire",
        percent = -100
    }
}
heat_extractor.picture = {
    layers =
    {
        {
            filename = "__spaceplatform-block__/graphics/entity/heat-extractor/heat-extractor.png",
            width = 300,
            height = 300,
            scale = 0.5,
            shift = { 0, 0 }
        },
        {
            filename = "__spaceplatform-block__/graphics/entity/heat-extractor/heat-extractor-shadow.png",
            width = 420,
            height = 289,
            scale = 0.5,
            shift = { 1.625, 0 },
            draw_as_shadow = true
        }
    }
}
heat_extractor.working_light_picture = nil
heat_extractor.heat_buffer.minimum_glow_temperature = 100
heat_extractor.heat_buffer.connections = {
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
}
heat_extractor.heat_buffer.heat_picture = {
    layers = {
        {
            filename = "__spaceplatform-block__/graphics/entity/heat-extractor/heat-extractor-lights-color.png",
            blend_mode = "additive",
            height = 300,
            scale = 0.5,
            shift = {
                0,
                0
            },
            tint = {
                1,
                1,
                1,
                0.9
            },
            width = 300
        },
        {
            draw_as_light = true,
            blend_mode = "additive",
            filename = "__spaceplatform-block__/graphics/entity/heat-extractor/heat-extractor-lights-color.png",
            height = 300,
            scale = 0.5,
            shift = {
                0,
                0
            },
            tint = {
                1,
                1,
                1,
                1
            },
            width = 300
        }
    }
}
data:extend {
    heat_extractor
}

