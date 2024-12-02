local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
data.raw["item"]["iron-bacteria"].order="b-e"
data:extend({
    {--生物溶剂
        type = "fluid",
        name = "organic-solution",
        icon = "__spaceplatform-block__/graphics/icons/organic-solution.png",
        subgroup = "fluid",
        order = "b-a-a",
        default_temperature = 40,
        max_temperature = 100,
        base_color = {0.48, 0.52, 0.15},
        flow_color = {0.48, 0.52, 0.15},
        auto_barrel = false
    },
    {--普通细菌
      type = "item",
      name = "bacteria",
      icon = "__spaceplatform-block__/graphics/icons/bacteria.png",
      pictures =
      {
        { size = 64, filename = "__spaceplatform-block__/graphics/icons/bacteria.png", scale = 0.5, mipmap_count = 4 }
      },
      subgroup = "agriculture-processes",
      order = "b[agriculture]-c[bacteria]",
      inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
      pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
      drop_sound = space_age_item_sounds.agriculture_inventory_move,
      stack_size = 50,
      default_import_location = "gleba",
      weight = 1 * kg,
      spoil_ticks = 1 * minute,
      spoil_result = "carbon"
    },
    {--塑料细菌
      type = "item",
      name = "plastic-bacteria",
      icon = "__spaceplatform-block__/graphics/icons/plastic-bacteria.png",
      pictures =
      {
        { size = 64, filename = "__spaceplatform-block__/graphics/icons/plastic-bacteria.png", scale = 0.5, mipmap_count = 4 }
      },
      subgroup = "agriculture-processes",
      order = "b[agriculture]-f",
      inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
      pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
      drop_sound = space_age_item_sounds.agriculture_inventory_move,
      stack_size = 50,
      default_import_location = "gleba",
      weight = 1 * kg,
      spoil_ticks = 1 * minute,
      spoil_result = "bacteria"
    },
    {--硫细菌
      type = "item",
      name = "sulfur-bacteria",
      icon = "__spaceplatform-block__/graphics/icons/sulfur-bacteria.png",
      pictures =
      {
        { size = 64, filename = "__spaceplatform-block__/graphics/icons/sulfur-bacteria.png", scale = 0.5, mipmap_count = 4 }
      },
      subgroup = "agriculture-processes",
      order = "b[agriculture]-g",
      inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
      pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
      drop_sound = space_age_item_sounds.agriculture_inventory_move,
      stack_size = 50,
      default_import_location = "gleba",
      weight = 1 * kg,
      spoil_ticks = 1 * minute,
      spoil_result = "bacteria"
    },
    {--油细菌
      type = "item",
      name = "oil-bacteria",
      icon = "__spaceplatform-block__/graphics/icons/oil-bacteria.png",
      pictures =
      {
        { size = 64, filename = "__spaceplatform-block__/graphics/icons/oil-bacteria.png", scale = 0.5, mipmap_count = 4 }
      },
      subgroup = "agriculture-processes",
      order = "b[agriculture]-h",
      inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
      pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
      drop_sound = space_age_item_sounds.agriculture_inventory_move,
      stack_size = 50,
      default_import_location = "gleba",
      weight = 1 * kg,
      spoil_ticks = 1 * minute,
      spoil_result = "bacteria"
    },
    {--沥青铀矿
      type = "item",
      name = "pitchblende",
      icon = "__spaceplatform-block__/graphics/icons/pitchblende.png",
      pictures =
      {
        { size = 64, filename = "__spaceplatform-block__/graphics/icons/pitchblende.png", scale = 0.5, mipmap_count = 4 }
      },
      subgroup = "intermediate-product",
      order = "b-a",
      inventory_move_sound = {
        filename = "__base__/sound/item/resource-inventory-move.ogg",
        volume = 0.8
      },
      pick_sound = {
        filename = "__base__/sound/item/resource-inventory-pickup.ogg",
        volume = 0.6
      },
      drop_sound = {
        filename = "__base__/sound/item/resource-inventory-move.ogg",
        volume = 0.8
      },
      stack_size = 50,
      default_import_location = "nauvis",
      weight = 1 * kg
    },
    {--有机质星岩
      type="item",
      name="organic-asteroid-chunk",
      icon="__spaceplatform-block__/graphics/icons/organic-asteroid-chunk.png",
      subgroup="space-material",
      stack_size = 1,
      default_import_location = "nauvis",
      weight = 100 * kg,
      order="z-z-z",
      spoil_ticks = 5 * minute,
      spoil_to_trigger_result={
        items_per_trigger = 1,
        trigger = {
          action_delivery = {
            source_effects = {
              {
                affects_target = true,
                as_enemy = true,
                entity_name = "small-strafer-pentapod",
                find_non_colliding_position = true,
                non_colliding_fail_result = {
                  action_delivery = {
                    source_effects = {
                      {
                        affects_target = true,
                        as_enemy = true,
                        entity_name = "small-strafer-pentapod",
                        offset_deviation = {
                          {
                            -1,
                            -1
                          },
                          {
                            1,
                            1
                          }
                        },
                        show_in_tooltip = false,
                        type = "create-entity"
                      }
                    },
                    type = "instant"
                  },
                  type = "direct"
                },
                offset_deviation = {
                  {
                    -5,
                    -5
                  },
                  {
                    5,
                    5
                  }
                },
                show_in_tooltip = true,
                type = "create-entity"
              }
            },
            type = "instant"
          },
          type = "direct"
        }
      }
    },
    {--铀矿星岩
    type="item",
    name="uranium-asteroid-chunk",
    icon="__spaceplatform-block__/graphics/icons/uranium-asteroid-chunk.png",
    subgroup="space-material",
    stack_size = 1,
    default_import_location = "nauvisorbit",
    weight = 100 * kg,
    order="z-z-z",
    },
    {--钨矿星岩
    type="item",
    name="tungsten-asteroid-chunk",
    icon="__spaceplatform-block__/graphics/icons/tungsten-asteroid-chunk.png",
    subgroup="space-material",
    stack_size = 1,
    default_import_location = "vulcanus",
    weight = 100 * kg,
    order="z-z-z",
    },
    {--钬矿星岩
    type="item",
    name="holmium-asteroid-chunk",
    icon="__spaceplatform-block__/graphics/icons/holmium-asteroid-chunk.png",
    subgroup="space-material",
    stack_size = 1,
    default_import_location = "fulgora",
    weight = 100 * kg,
    order="z-z-z",
    },
    {--冰星星岩
    type="item",
    name="aquilo-asteroid-chunk",
    icon="__spaceplatform-block__/graphics/icons/aquilo-asteroid-chunk.png",
    subgroup="space-material",
    stack_size = 1,
    default_import_location = "aquilo",
    weight = 100 * kg,
    order="z-z-z",
    }
})
data.raw.item["iron-bacteria"].spoil_result="oil-bacteria"
data.raw.item["copper-bacteria"].spoil_result="oil-bacteria"
data.raw.item["rocket-silo"].weight=1000000
-- local tiles=mothership_pack.tiles
-- for _,tile in pairs(tiles) do
--   tile.tile="overgrowth-yumako-soil"
-- end
-- table.insert(tiles,{
--   position = {
--     5,
--     6
--   },
--   tile = "space-platform-foundation"
-- })
-- mothership_pack.tiles=tiles
local pack_pattern={--启动包
  create_electric_network = false,
  drop_sound = {
    filename = "__base__/sound/item/mechanical-large-inventory-move.ogg",
    volume = 0.7
  },
  icon = "__space-age__/graphics/icons/space-platform-hub.png",
  initial_items = {
    {
      amount = 10,
      name = "space-platform-foundation",
      type = "item"
    }
  },--没有hub就没有初始物品
  inventory_move_sound = {
    filename = "__base__/sound/item/mechanical-large-inventory-move.ogg",
    volume = 0.7
  },
  name = "",
  order = "z",
  pick_sound = {
    filename = "__base__/sound/item/mechanical-large-inventory-pickup.ogg",
    volume = 0.8
  },
  stack_size = 1,
  subgroup = "space-rocket",
  surface = "space-platform",
  trigger = {
    {
      action_delivery = {
        source_effects = {
          {
            entity_name = "fish",
            type = "create-entity"
          }
        },
        type = "instant"
      },
      type = "direct"
    }
  },
  type = "space-platform-starter-pack",
  weight = 1000000,
  hidden=true,
  hidden_in_factoriopedia=true,
  tiles={}
}

for i=-5,5 do
  for j=-5,5 do
    local tile=
    {
        position = {
          i,
          j
        },
        tile = "space-platform-foundation"
    }
    table.insert(pack_pattern.tiles,tile)
  end
end-- -5~5填充地板
--添加给平台准备的启动包
local normal_pack = table.deepcopy(pack_pattern)
normal_pack.name="normal-pack"
local mothership_pack=table.deepcopy(pack_pattern)
mothership_pack.name="mothership-pack"
mothership_pack.icon="__base__/graphics/icons/satellite.png"
mothership_pack.trigger={
  { 
    action_delivery = {
      source_effects = {
        {
          entity_name = "substation",
          type = "create-entity"
        }
      },
      type = "instant"
    },
    type = "direct"
  }
}
local vulcanus_pack = table.deepcopy(pack_pattern)
vulcanus_pack.name="5-pack"
vulcanus_pack.trigger={
  { 
    action_delivery = {
      source_effects = {
        {
          entity_name = "foundry",
          type = "create-entity"
        }
      },
      type = "instant"
    },
    type = "direct"
  }
}
local nauvis_pack = table.deepcopy(pack_pattern)
nauvis_pack.name="6-pack"
nauvis_pack.trigger={
  { 
    action_delivery = {
      source_effects = {
        {
          entity_name = "crash-site-spaceship",
          type = "create-entity"
        }
      },
      type = "instant"
    },
    type = "direct"
  }
}
nauvis_pack.tiles={}
for i=-18,25 do
  for j=-7,7 do
    local tile=
    {
        position = {
          i,
          j
        },
        tile = "space-platform-foundation"
    }
    table.insert(nauvis_pack.tiles,tile)
  end
end
local gleba_pack = table.deepcopy(pack_pattern)
gleba_pack.name="7-pack"
gleba_pack.trigger={
  { 
    action_delivery = {
      source_effects = {
        {
          entity_name = "gleba-spawner",
          type = "create-entity",
          as_enemy = true
        }
      },
      type = "instant"
    },
    type = "direct"
  }
}
for i=-6,6 do
  for j=-6,6 do
    local tile=
    {
        position = {
          i,
          j+12
        },
        tile = "space-platform-foundation"
    }
    if i>-6 and i<6 and j>-6 and j<6 then
      if i>0 then
        tile.tile="natural-jellynut-soil"
      else tile.tile="natural-yumako-soil"
      end
    end
    table.insert(gleba_pack.tiles,tile)
  end
end
local aquilo_pack = table.deepcopy(pack_pattern)
aquilo_pack.name="8-pack"

aquilo_pack.trigger={
  { 
    action_delivery = {
      source_effects = {
        {
          entity_name = "fusion-reactor",
          type = "create-entity"
        }
      },
      type = "instant"
    },
    type = "direct"
  }
}
local fulgora_pack = table.deepcopy(pack_pattern)
fulgora_pack.name="9-pack"

fulgora_pack.trigger={
  { 
    action_delivery = {
      source_effects = {
        {
          entity_name = "electromagnetic-plant",
          type = "create-entity"
        }
      },
      type = "instant"
    },
    type = "direct"
  }
}


local random_pack1 = table.deepcopy(pack_pattern)
random_pack1.name="1-pack"
random_pack1.trigger={
  { 
    action_delivery = {
      source_effects = {
        {
          entity_name = "biter-spawner",
          type = "create-entity",
          as_enemy = true
        }
      },
      type = "instant"
    },
    type = "direct"
  }
}
local random_pack2 = table.deepcopy(pack_pattern)
random_pack2.name="2-pack"
random_pack2.trigger={
  { 
    action_delivery = {
      source_effects = {
        {
          entity_name = "fulgoran-ruin-attractor",
          type = "create-entity"
        }
      },
      type = "instant"
    },
    type = "direct"
  }
}
local random_pack3 = table.deepcopy(pack_pattern)
random_pack3.name="3-pack"
random_pack3.trigger={
  { 
    action_delivery = {
      {
        source_effects = {
          {
            entity_name = "big-stomper-shell",
            type = "create-entity"
          },
          {
            entity_name = "big-stomper-pentapod",
            type = "create-entity",
            repeat_count=3,
            as_enemy=true
          }
        },
        type = "instant"
      }
    },
    type = "direct"
  }
}
random_pack3.tiles={}
for i=-10,10 do
  for j=-10,10 do
    local tile=
    {
        position = {
          i,
          j
        },
        tile = "space-platform-foundation"
    }
    table.insert(random_pack3.tiles,tile)
  end
end
data.raw["simple-entity"]["big-stomper-shell"].minable.results={
  {
    amount_max = 10,
    amount_min = 1,
    name = "stone",
    type = "item"
  },
  {
    amount_max = 10,
    amount_min = 1,
    name = "spoilage",
    type = "item"
  },
  {
    amount_max = 2,
    amount_min = 1,
    name = "raw-fish",
    type = "item"
  }
}
local random_pack4 = table.deepcopy(pack_pattern)
random_pack4.name="4-pack"
random_pack4.trigger={
  { 
    action_delivery = {
      source_effects = {
        {
          entity_name = "medium-demolisher",
          type = "create-entity",
          as_enemy=true
        }
      },
      type = "instant"
    },
    type = "direct"
  }
}
random_pack4.tiles={}
for i=-10,10 do
  for j=-10,10 do
    local tile=
    {
        position = {
          i,
          j
        },
        tile = "space-platform-foundation"
    }
    table.insert(random_pack4.tiles,tile)
  end
end
data:extend{
  mothership_pack,
  vulcanus_pack,
  nauvis_pack,
  gleba_pack,
  aquilo_pack,
  fulgora_pack,
  random_pack1,
  random_pack2,
  random_pack3,
  random_pack4,
  normal_pack
}