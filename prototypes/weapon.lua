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
--搞个能打陨石的重炮
local artillery_turret = table.deepcopy(data.raw["artillery-turret"]["artillery-turret"])
artillery_turret.icon = "__spaceplatform-block__/graphics/icons/automated-artillery-turret.png"
artillery_turret.name = "automated-artillery-turret"
artillery_turret.type = "ammo-turret"
artillery_turret.rotation_speed = artillery_turret.turret_rotation_speed
artillery_turret.call_for_help_radius = 0
local attack_parameters = {
  ammo_category = "artillery-shell",
  cooldown = 60,
  min_range = 32,
  movement_slow_down_factor = 0,
  projectile_center = {
    -0.15625,
    -0.078119999999999994
  },
  projectile_creation_distance = 1.6000000000000001,
  range = 224,
  turn_range = 90 / 360,
  shell_particle = {
    center = {
      0,
      -0.5
    },
    creation_distance = 0.5,
    creation_distance_orientation = 0.4,
    direction = 0.4,
    direction_deviation = 0.05,
    height = 1,
    name = "artillery-shell-particle",
    speed = 0.1,
    speed_deviation = 0.1,
    starting_frame_speed = 0.5,
    starting_frame_speed_deviation = 0.5,
    -- use_source_position = true,加了会闪退
    vertical_speed = 0.05,
    vertical_speed_deviation = 0.01
  },
  sound = {
    filename = "__base__/sound/fight/artillery-shoots-1.ogg",
    game_controller_vibration_data = {
      duration = 150,
      low_frequency_vibration_intensity = 1,
      play_for = "everything"
    },
    modifiers = {
      type = "main-menu",
      volume_multiplier = 0.9
    },
    switch_vibration_data = {
      filename = "__base__/sound/fight/artillery-shoots.bnvib",
      play_for = "everything"
    },
    volume = 0.7
  },
  type = "projectile"
}
attack_parameters.projectile_creation_parameters = table.deepcopy(data.raw.gun["artillery-wagon-cannon"]
  .attack_parameters.projectile_creation_parameters)
artillery_turret.attack_parameters = attack_parameters
artillery_turret.graphics_set = {
  base_visualisation = {
    animation = {
      layers = {
        {
          filename = "__base__/graphics/entity/artillery-turret/artillery-turret-base.png",
          height = 199,
          line_length = 1,
          priority = "high",
          scale = 0.5,
          width = 207
        },
        {
          draw_as_shadow = true,
          filename = "__base__/graphics/entity/artillery-turret/artillery-turret-base-shadow.png",
          height = 149,
          line_length = 1,
          priority = "high",
          scale = 0.5,
          shift = {
            0.5625,
            0.5
          },
          width = 277
        }
      },
      render_layer = "lower-object-above-shadow"
    }
  }
}
artillery_turret.folded_animation = {
  layers = {
    {
      allow_low_quality_rotation = true,
      direction_count = 256,
      filenames = {
        "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-1.png",
        "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-2.png",
        "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-3.png",
        "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-4.png",
        "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-5.png",
        "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-6.png",
        "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-7.png",
        "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-8.png"
      },
      height = 384,
      line_length = 4,
      lines_per_file = 8,
      priority = "very-low",
      scale = 0.5,
      shift = {
        0,
        -1.75 - 1
      },
      width = 530
    },
    {
      allow_low_quality_rotation = true,
      direction_count = 256,
      draw_as_shadow = true,
      filenames = {
        "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-1.png",
        "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-2.png",
        "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-3.png",
        "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-4.png",
        "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-5.png",
        "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-6.png",
        "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-7.png",
        "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-8.png"
      },
      height = 398,
      line_length = 4,
      lines_per_file = 8,
      priority = "very-low",
      scale = 0.5,
      shift = {
        2.421875,
        0.015625 - 1
      },
      width = 578
    },
    {
      allow_low_quality_rotation = true,
      dice = 4,
      direction_count = 256,
      filenames = {
        "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-1.png",
        "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-2.png",
        "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-3.png",
        "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-4.png",
        "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-5.png",
        "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-6.png",
        "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-7.png",
        "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-8.png"
      },
      height = 280,
      line_length = 4,
      lines_per_file = 8,
      priority = "very-low",
      scale = 0.5,
      shift = {
        0,
        -1.359375 - 1
      },
      width = 378
    },
    {
      allow_low_quality_rotation = true,
      dice = 4,
      direction_count = 256,
      draw_as_shadow = true,
      filenames = {
        "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-1.png",
        "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-2.png",
        "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-3.png",
        "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-4.png",
        "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-5.png",
        "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-6.png",
        "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-7.png",
        "__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-8.png"
      },
      height = 266,
      line_length = 4,
      lines_per_file = 8,
      priority = "very-low",
      scale = 0.5,
      shift = {
        1.796875,
        0.03125 - 1
      },
      width = 390
    }
  }
}
artillery_turret.call_for_help_radius = 40
artillery_turret.circuit_connector = { artillery_turret.circuit_connector }
data:extend { artillery_turret }
--反向播放动画的爆炸动画，很炫酷
local reversed_explosion = table.deepcopy(data.raw.explosion.explosion)
reversed_explosion.name = "reversed-explosion"
reversed_explosion.animations = {
  {
    animation_speed = 0.5,
    draw_as_glow = true,
    filename = "__spaceplatform-block__/graphics/entity/explosion/reversed-explosion-1.png",
    frame_count = 17,
    height = 42,
    line_length = 6,
    priority = "high",
    scale = 0.5,
    shift = {
      0.140625,
      0.1875
    },
    usage = "explosion",
    width = 48
  },
  {
    animation_speed = 0.5,
    draw_as_glow = true,
    filename = "__spaceplatform-block__/graphics/entity/explosion/reversed-explosion-3.png",
    frame_count = 17,
    height = 88,
    line_length = 6,
    priority = "high",
    scale = 0.5,
    shift = {
      -0.03125,
      0.046875
    },
    usage = "explosion",
    width = 102
  }
}
reversed_explosion.sound.variations = {
  {
    filename = "__spaceplatform-block__/sound/reversed-small-explosion-1.ogg",
    max_volume = 0.5,
    min_volume = 0.25,
    modifiers = {
      type = "main-menu",
      volume_multiplier = 1.2
    }
  },
  {
    filename = "__spaceplatform-block__/sound/reversed-small-explosion-2.ogg",
    max_volume = 0.5,
    min_volume = 0.25,
    modifiers = {
      type = "main-menu",
      volume_multiplier = 1.2
    }
  },
  {
    filename = "__spaceplatform-block__/sound/reversed-small-explosion-3.ogg",
    max_volume = 0.5,
    min_volume = 0.25,
    modifiers = {
      type = "main-menu",
      volume_multiplier = 1.2
    }
  },
  {
    filename = "__spaceplatform-block__/sound/reversed-small-explosion-4.ogg",
    max_volume = 0.5,
    min_volume = 0.25,
    modifiers = {
      type = "main-menu",
      volume_multiplier = 1.2
    }
  },
  {
    filename = "__spaceplatform-block__/sound/reversed-small-explosion-5.ogg",
    max_volume = 0.5,
    min_volume = 0.25,
    modifiers = {
      type = "main-menu",
      volume_multiplier = 1.2
    }
  }
}
data:extend { reversed_explosion }
--打到目标生成陨石的火箭弹
local asteroid_rocket_projectile = table.deepcopy(data.raw.projectile.rocket)
asteroid_rocket_projectile.name = "asteroid-rocket"
asteroid_rocket_projectile.action.action_delivery.target_effects = {
  {
    entity_name = "reversed-explosion",
    type = "create-entity"
  },
  {
    type = "script",
    effect_id = "generate-asteroid-rocket"
  },
  {
    check_buildability = true,
    entity_name = "small-scorchmark-tintable",
    type = "create-entity"
  },
  {
    repeat_count = 1,
    type = "invoke-tile-trigger"
  },
  {
    decoratives_with_trigger_only = false,
    from_render_layer = "decorative",
    include_decals = false,
    include_soft_decoratives = true,
    invoke_decorative_trigger = true,
    radius = 1.5,
    to_render_layer = "object",
    type = "destroy-decoratives"
  }
}
data:extend { asteroid_rocket_projectile }
local asteroid_rocket = table.deepcopy(data.raw.ammo.rocket)
asteroid_rocket.name = "asteroid-rocket"
asteroid_rocket.ammo_type.action = {
  action_delivery = {
    projectile = "asteroid-rocket",
    source_effects = {
      entity_name = "explosion-hit",
      type = "create-entity"
    },
    starting_speed = 0.1,
    type = "projectile"
  },
  type = "direct"
}
data:extend { asteroid_rocket }


--生成星块的子弹
local asteroid_magazine = table.deepcopy(data.raw.ammo["firearm-magazine"])
asteroid_magazine.name = "asteroid_magazine"
asteroid_magazine.ammo_type.action[1].action_delivery[1].target_effects={
  {
    entity_name = "explosion-hit",
    offset_deviation = {
      {
        -0.5,
        -0.5
      },
      {
        0.5,
        0.5
      }
    },
    offsets = {
      {
        0,
        1
      }
    },
    type = "create-entity"
  },
  {
    type = "script",
    effect_id = "generate-asteroid-magazine"
  },
  {
    deliver_category = "bullet",
    type = "activate-impact"
  }
}
data:extend { asteroid_magazine }

--生成人造星岩的重炮炮弹
local asteroid_shell = table.deepcopy(data.raw.ammo["artillery-shell"])
asteroid_shell.name = "asteroid-artillery-shell"
asteroid_shell.ammo_type.action.action_delivery.projectile = "asteroid-artillery-projectile"
asteroid_shell.icon = "__spaceplatform-block__/graphics/icons/asteroid-artillery-shell.png"
data:extend { asteroid_shell }
local asteroid_pro = table.deepcopy(data.raw["artillery-projectile"]["artillery-projectile"])
local target_effects = asteroid_pro.action.action_delivery.target_effects
table.insert(target_effects, {
  type = "script",
  effect_id = "generate-asteroid-artillery"
})
asteroid_pro.name = "asteroid-artillery-projectile"
data:extend { asteroid_pro }
