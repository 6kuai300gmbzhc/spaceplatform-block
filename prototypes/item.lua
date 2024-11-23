local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
data.raw["item"]["iron-bacteria"].order="b-e"
data:extend({
    {--生物溶剂
        type = "fluid",
        name = "organic-solution",
        icon = "__spaceship-beginning__/graphics/icons/organic-solution.png",
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
      icon = "__spaceship-beginning__/graphics/icons/bacteria.png",
      pictures =
      {
        { size = 64, filename = "__spaceship-beginning__/graphics/icons/bacteria.png", scale = 0.5, mipmap_count = 4 }
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
      icon = "__spaceship-beginning__/graphics/icons/plastic-bacteria.png",
      pictures =
      {
        { size = 64, filename = "__spaceship-beginning__/graphics/icons/plastic-bacteria.png", scale = 0.5, mipmap_count = 4 }
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
      icon = "__spaceship-beginning__/graphics/icons/sulfur-bacteria.png",
      pictures =
      {
        { size = 64, filename = "__spaceship-beginning__/graphics/icons/sulfur-bacteria.png", scale = 0.5, mipmap_count = 4 }
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
      icon = "__spaceship-beginning__/graphics/icons/oil-bacteria.png",
      pictures =
      {
        { size = 64, filename = "__spaceship-beginning__/graphics/icons/oil-bacteria.png", scale = 0.5, mipmap_count = 4 }
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
      icon = "__spaceship-beginning__/graphics/icons/pitchblende.png",
      pictures =
      {
        { size = 64, filename = "__spaceship-beginning__/graphics/icons/pitchblende.png", scale = 0.5, mipmap_count = 4 }
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
      icon="__spaceship-beginning__/graphics/icons/organic-asteroid-chunk.png",
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
    {--冰星星岩
    type="item",
    name="aquilo-asteroid-chunk",
    icon="__spaceship-beginning__/graphics/icons/aquilo-asteroid-chunk.png",
    subgroup="space-material",
    stack_size = 1,
    default_import_location = "aquilo",
    weight = 100 * kg,
    order="z-z-z",
    }
    
})
data.raw.item["iron-bacteria"].spoil_result="oil-bacteria"
data.raw.item["copper-bacteria"].spoil_result="oil-bacteria"
local start_pack2=table.deepcopy(data.raw["space-platform-starter-pack"]["space-platform-starter-pack"])
start_pack2.name="satellite-pack"
start_pack2.initial_items = {
  {
    amount = 10,
    name = "space-platform-foundation",
    type = "item"
  }
}
data:extend{
  start_pack2
}
