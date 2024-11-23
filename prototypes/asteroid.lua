data:extend{
    {--有机质星岩
        dying_trigger_effect = {
          {
            entity_name = "small-strafer-pentapod-leg-die",
            type = "create-entity"
          }
        },
        icon = "__spaceship-beginning__/graphics/icons/organic-asteroid-chunk.png",
        icon_size = 64,
        minable = {
          mining_particle = "carbonic-asteroid-chunk-particle-medium",
          mining_time = 0.2,
          result = "organic-asteroid-chunk"
        },
        name = "organic-asteroid-chunk",
        order = "d-a[chunk]",
        subgroup = "space-material",
        type = "asteroid-chunk",
        graphics_set = {
          ambient_light = {
            0.01,
            0.01,
            0.01
          },
          brightness = 0.9,
          light_width = 0,
          lights = {
            {
              color = {
                0.95999999999999996,
                1,
                0.99000000000000004
              },
              direction = {
                0.7,
                0.6,
                -1
              }
            },
            {
              color = {
                0.85,
                0.5,
                0.4
              },
              direction = {
                -1,
                -45,
                0.1
              }
            },
            {
              color = {
                0.1,
                0.1,
                0.1
              },
              direction = {
                -0.4,
                -0.25,
                -0.5
              }
            }
          },
          normal_strength = 1.2,
          rotation_speed = 0.0014999999999999996,
          specular_power = 2,
          specular_purity = 0,
          specular_strength = 2,
          sss_amount = 0,
          sss_contrast = 1,
          variations = {
            {
              color_texture = {
                filename = "__spaceship-beginning__/graphics/asteroid/chunk/organic/asteroid-organic-chunk-colour-01.png",
                scale = 0.5,
                size = 50
              },
              normal_map = {
                filename = "__spaceship-beginning__/graphics/asteroid/chunk/organic/asteroid-organic-chunk-normal-01.png",
                premul_alpha = false,
                scale = 0.5,
                size = 50
              },
              roughness_map = {
                filename = "__spaceship-beginning__/graphics/asteroid/chunk/organic/asteroid-organic-chunk-roughness-01.png",
                premul_alpha = false,
                scale = 0.5,
                size = 50
              },
              shadow_shift = {
                0.25,
                0.25
              }
            }
          }
        }
    },
    {--冰星星岩
    dying_trigger_effect = {
      {
        entity_name = "metallic-asteroid-explosion-1",
        type = "create-entity"
      }
    },
    icon = "__spaceship-beginning__/graphics/icons/organic-asteroid-chunk.png",
    icon_size = 64,
    minable = {
      mining_particle = "carbonic-asteroid-chunk-particle-medium",
      mining_time = 0.2,
      result = "organic-asteroid-chunk"
    },
    name = "aquilo-asteroid-chunk",
    order = "d-a[chunk]",
    subgroup = "space-material",
    type = "asteroid-chunk",
    graphics_set = {
      ambient_light = {
        0.01,
        0.01,
        0.01
      },
      brightness = 0.9,
      light_width = 0,
      lights = {
        {
          color = {
            0.95999999999999996,
            1,
            0.99000000000000004
          },
          direction = {
            0.7,
            0.6,
            -1
          }
        },
        {
          color = {
            0.85,
            0.5,
            0.4
          },
          direction = {
            -1,
            -45,
            0.1
          }
        },
        {
          color = {
            0.1,
            0.1,
            0.1
          },
          direction = {
            -0.4,
            -0.25,
            -0.5
          }
        }
      },
      normal_strength = 1.2,
      rotation_speed = 0.0014999999999999996,
      specular_power = 2,
      specular_purity = 0,
      specular_strength = 2,
      sss_amount = 0,
      sss_contrast = 1,
      variations = {
        {
          color_texture = {
            filename = "__spaceship-beginning__/graphics/asteroid/chunk/aquilo/asteroid-aquilo-chunk-colour-01.png",
            scale = 0.5,
            size = 50
          },
          normal_map = {
            filename = "__spaceship-beginning__/graphics/asteroid/chunk/aquilo/asteroid-aquilo-chunk-normal-01.png",
            premul_alpha = false,
            scale = 0.5,
            size = 50
          },
          roughness_map = {
            filename = "__spaceship-beginning__/graphics/asteroid/chunk/aquilo/asteroid-aquilo-chunk-roughness-01.png",
            premul_alpha = false,
            scale = 0.5,
            size = 50
          },
          shadow_shift = {
            0.25,
            0.25
          }
        }
      }
    }
    }
}
local utils=require("utils")
utils.add_asteroid_to_planet("gleba","organic","chunk",0.003)
utils.add_asteroid_to_connection("nauvis-gleba","organic","chunk",0,0.1)
utils.add_asteroid_to_connection("nauvis-gleba","organic","chunk",0.004,0.8)
utils.add_asteroid_to_connection("vulcanus-gleba","organic","chunk",0.002,0.5)
utils.add_asteroid_to_connection("vulcanus-gleba","organic","chunk",0.004,0.8)
utils.add_asteroid_to_connection("gleba-fulgora","organic","chunk",0.004,0.2)
utils.add_asteroid_to_connection("gleba-fulgora","organic","chunk",0,0.6)
utils.add_asteroid_to_connection("gleba-aquilo","organic","chunk",0.004,0.2)
utils.add_asteroid_to_connection("gleba-aquilo","organic","chunk",0,0.6)
local aquilo_asteroid_spawn={
  repeat_count = 10,
  asteroid_name = "aquilo-asteroid-chunk",
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
  offsets = {
    {
      -1,
      -0.25
    },
    {
      0,
      -0.5
    },
    {
      1,
      -0.25
    }
  },
  type = "create-asteroid-chunk"
}
table.insert(data.raw.asteroid["big-oxide-asteroid"].dying_trigger_effect,aquilo_asteroid_spawn)