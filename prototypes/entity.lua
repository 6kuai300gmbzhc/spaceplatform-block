require("prototypes.entity.fly-to-die-thruster")
require("prototypes.entity.reverse-thruster")


local utils = require("utils")
local pipe_pic = assembler3pipepictures()
local pipecoverpic = pipecoverspictures()
local box3 = { { -1.5, -1.5 }, { 1.5, 1.5 } } -- 调整为3的大小
local box4 = { { -2, -2 }, { 2, 2 } }         -- 保持不变
local box5 = { { -2.5, -2.5 }, { 2.5, 2.5 } } -- 保持不变
local box6 = { { -3, -3 }, { 3, 3 } }         -- 调整为6的大小
local box7 = { { -3.5, -3.5 }, { 3.5, 3.5 } } -- 调整为7的大小
local box8 = { { -4, -4 }, { 4, 4 } }         -- 调整为8的大小
local box11 = { { -5.5, -5.5 }, { 5.5, 5.5 } }
local function shrinkBox(box)
  -- 获取 box 的左下角和右上角坐标
  local leftBottom = box[1]
  local rightTop = box[2]

  -- 计算缩小后的坐标
  local newLeftBottom = { leftBottom[1] + 0.1, leftBottom[2] + 0.1 }
  local newRightTop = { rightTop[1] - 0.1, rightTop[2] - 0.1 }

  -- 返回缩小后的 box
  return { newLeftBottom, newRightTop }
end
local base_item = {
  type = "item",
  name = "base-machine",
  icon = "__basee__/graphics/icon.png",
  icon_size = 32,
  subgroup = "production-machine",
  order = "a-a",
  place_result = "v-machine",
  weight = 10,
  stack_size = 50
}

local function add_item(entity)
  local item = table.deepcopy(base_item)
  item.name = entity.name
  item.icon = entity.icon
  item.icon_size = entity.icon_size
  item.place_result = item.name

  data:extend({ item })
end
local base = {
  type = "assembling-machine",
  name = "advanced-foundry",
  icon = "__spaceplatform-block__/graphics/icon.png",
  icon_size = 144,
  flags = { "placeable-neutral", "placeable-player", "player-creation", "not-rotatable" },
  minable = { hardness = 0.2, mining_time = 1, result = "universal-machine" },
  max_health = 2000,
  inventory_size = 300,
  corpse = "big-remnants",
  dying_explosion = "big-explosion",
  resistances = { { type = "fire", percent = 10 } },
  fluid_boxes = {
    {
      production_type = "input",
      volume = 1000,
      pipe_picture = pipe_pic,
      pipe_covers = pipecoverpic,
      pipe_connections = { { direction = defines.direction.north, flow_direction = "input", position = { 0, -2.3 } } },
      secondary_draw_orders = { north = -1 }
    },
    --北
    {
      production_type = "input",
      volume = 1000,
      pipe_picture = pipe_pic,
      pipe_covers = pipecoverpic,
      pipe_connections = { { direction = defines.direction.west, flow_direction = "input", position = { -2.3, 0 } } },
      secondary_draw_orders = { north = -1 }
    },
    --{
    --    production_type = "input",
    --    volume = 1000,
    --    pipe_picture = pipe_pic,
    --    pipe_covers = pipecoverpic,
    --    pipe_connections = { { direction = defines.direction.north, flow_direction = "input", position = { 4, -4 } } },
    --    secondary_draw_orders = { north = -1 }
    --},
    {
      production_type = "output",
      volume = 1000,
      pipe_picture = pipe_pic,
      pipe_covers = pipecoverpic,
      pipe_connections = { { direction = defines.direction.south, flow_direction = "output", position = { 0, 2.3 } } },
      secondary_draw_orders = { north = -1 }
    },
    {
      production_type = "input",
      volume = 1000,
      pipe_picture = pipe_pic,
      pipe_covers = pipecoverpic,
      pipe_connections = { { direction = defines.direction.east, flow_direction = "output", position = { 2.3, 0 } } },
      secondary_draw_orders = { north = -1 }
    },
  },
  fluid_boxes_off_when_no_fluid_recipe = true,
  collision_box = { { -2.4, -2.4 }, { 2.4, 2.4 } },
  selection_box = { { -2.5, -2.5 }, { 2.5, 2.5 } },
  graphics_set = {
    animation = {
      layers = {

      },
    },

    reset_animation_when_frozen = true
  },
  crafting_categories = { "smelting", "metallurgy-or-assembling", "metallurgy-or-assembling", "crafting-with-fluid-or-metallurgy" },
  --                         "advanced-crafting",
  --                         "basic-crafting",
  --                         "centrifuging",
  --                         "chemistry",
  --                         "crafting",
  --                         "crafting-with-fluid",
  --                         "crafting-with-fluid-or-metallurgy",
  --                         "pressing",
  --                         "electronics",
  --                         "electronics-with-fluid",
  --                         "electronics-or-assembling",
  --                         "cryogenics-or-assembling",
  --                         "organic-or-hand-crafting",
  --                         "organic-or-assembling",
  --                         "metallurgy-or-assembling",
  --                         "oil-processing",
  --                         "rocket-building",
  --                         "smelting", },

  crafting_speed = 3,
  impact_category = "metal",
  circuit_connector = circuit_connector_definitions["assembling-machine"],
  circuit_wire_max_distance = 20,
  energy_usage = "300kW",
  ingredient_count = 6,
  module_slots = 20,
  allowed_effects = { "consumption", "speed", "productivity", "pollution", "quality" },
  heating_energy = feature_flags["freezing"] and "100kW" or nil,
  open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
  close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
  squeak_behaviour = false,
  working_sound = {
    audible_distance_modifier = 0.5,
    fade_in_ticks = 4,
    fade_out_ticks = 20,
    sound = {
      filename = "__base__/sound/assembling-machine-t3-1.ogg",
      volume = 0.45
    }
  }
}
local function add_entity(entity)
  local base_entity = table.deepcopy(base)

  for name, value in pairs(entity) do
    base_entity[name] = value
  end
  base_entity.collision_box = shrinkBox(entity.selection_box)

  data:extend({ base_entity })

  add_item(entity)
end
add_entity({
  name = "arc-furnace",
  icon = "__spaceplatform-block__/graphics/entity/arc-furnace/arc-furnace-hr-structure.png",
  icon_size = 320,
  minable = { hardness = 0.2, mining_time = 1, result = "arc-furnace" },
  selection_box = box5,
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
          animation_speed = 0.25,
        },
        {
          filename = "__spaceplatform-block__/graphics/entity/arc-furnace/arc-furnace-hr-structure.png",
          size = { 320, 320 },
          shift = { 0, 0 },
          scale = 0.5,
          line_length = 1,
          frame_count = 1,
          repeat_count = 40,
          animation_speed = 0.25,
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
              filename = "__spaceplatform-block__/graphics/entity/arc-furnace/arc-furnace-hr-animation-emission-1.png",
              size = { 320, 320 },
              shift = { 0, 0 },
              scale = 0.5,
              line_length = 8,
              lines_per_file = 8,
              frame_count = 40,
              draw_as_glow = true,
              blend_mode = "additive",
              animation_speed = 0.25,
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
    connections = {
      {
        direction = 0,
        position = {
          -2,
          -2
        }
      },
      {
        direction = 0,
        position = {
          2,
          -2
        }
      },
      {
        direction = 4,
        position = {
          2,
          -2
        }
      },
      {
        direction = 4,
        position = {
          2,
          2
        }
      },
      {
        direction = 8,
        position = {
          2,
          2
        }
      },
      {
        direction = 8,
        position = {
          -2,
          2
        }
      },
      {
        direction = 12,
        position = {
          -2,
          2
        }
      },
      {
        direction = 12,
        position = {
          -2,
          -2
        }
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
})