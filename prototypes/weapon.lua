local utils = require("utils")
data.raw["artillery-projectile"]["artillery-projectile"].action.action_delivery.target_effects[1].action.action_delivery.target_effects =
{
  {
    damage = {
      amount = 10000,
      type = "physical"
    },
    type = "damage"
  },
  {
    damage = {
      amount = 10000,
      type = "explosion"
    },
    type = "damage"
  }
}
data.raw.stream["flamethrower-fire-stream"].action = {
  {
    action_delivery = {
      target_effects = {
        {
          apply_damage_to_trees = false,
          damage = {
            amount = 3,
            type = "fire"
          },
          type = "damage"
        }
      },
      type = "instant"
    },
    radius = 1,
    type = "area"
  }
}

data.raw.beam["chain-tesla-gun-beam-bounce"].action.action_delivery.target_effects =
{
  {
    damage = {
      amount = 120,
      type = "electric"
    },
    type = "damage"
  },
  {
    distance = 0.25,
    type = "push-back"
  },
  {
    sticker = "tesla-turret-stun",
    type = "create-sticker"
  },
  {
    sticker = "tesla-turret-slow",
    type = "create-sticker"
  }
}
data.raw.beam["chain-tesla-gun-beam-start"].action.action_delivery.target_effects[1] = {
  damage = {
    amount = 120,
    type = "electric"
  },
  type = "damage"
}
data.raw["chain-active-trigger"]["chain-tesla-turret-chain"].max_jumps = 4


local hardcore_tesla_tower = table.deepcopy(data.raw["electric-turret"]["tesla-turret"])
hardcore_tesla_tower.name = "hardcore-tesla-turret"
hardcore_tesla_tower.energy_source.drain = "1W"
hardcore_tesla_tower.attack_parameters.ammo_type.energy_consumption = "1J"
hardcore_tesla_tower.minable = nil
hardcore_tesla_tower.flags = {
  "placeable-player",
  "placeable-enemy",
  "player-creation",
  "not-deconstructable"
}
hardcore_tesla_tower.attack_parameters.cooldown = 6
hardcore_tesla_tower.rotation_speed = 0.05
hardcore_tesla_tower.attack_parameters.range = 40
hardcore_tesla_tower.attack_parameters.damage_modifier = 1
data:extend { hardcore_tesla_tower }


utils.set_ammo_damage("piercing-rounds-magazine", 12)
utils.set_ammo_damage("firearm-magazine", 7.5)
data.raw["ammo-turret"]["gun-turret"].attack_parameters.damage_modifier = 1.5

local init_tower = table.deepcopy(data.raw["electric-turret"]["laser-turret"])
local init_changes = {
  flags = {
    "placeable-player",
    "placeable-enemy",
    "player-creation",
    "not-deconstructable",
    "hide-alt-info",
    "not-selectable-in-game"
  },
  selectable_in_game = false,
  name = "init-tower",
  energy_source = { type = "void" },
  rotation_speed = 0.05,
  attack_parameters = {
    ammo_category = "electric",
    ammo_type = {
      action = {
        action_delivery = {
          target_effects = {
            type = "damage",
            damage = {
              amount = 240,
              type = "electric"
            }
          },
          type = "instant"
        },
        type = "direct"
      },
      energy_consumption = "1J"
    },
    cooldown = 10,
    damage_modifier = settings.startup["hardcore-sol-rate"].value,
    range = settings.startup["hardcore-safe-radius"].value,
    range_mode = "center-to-bounding-box",
    type = "beam"
  },
  graphics_set = {},
}
init_tower.folding_animation = nil
init_tower.folded_animation = utils.blank
init_tower.preparing_sound = nil
init_tower.folding_sound = nil
init_tower.preparing_animation = nil
init_tower.prepared_animation = nil
init_tower.energy_glow_animation = nil
init_tower.water_reflection = nil
init_tower.minable = nil
for name, value in pairs(init_changes) do
  init_tower[name] = value
end
data:extend {
  init_tower
}
