data:extend{
    {--有机质星岩
        dying_trigger_effect = {
          {
            entity_name = "small-strafer-pentapod-leg-die",
            type = "create-entity"
          }
        },
        icon = "__spaceplatform-block__/graphics/icons/organic-asteroid-chunk.png",
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
                filename = "__spaceplatform-block__/graphics/asteroid/chunk/organic/asteroid-organic-chunk-colour-01.png",
                scale = 0.5,
                size = 50
              },
              normal_map = {
                filename = "__spaceplatform-block__/graphics/asteroid/chunk/organic/asteroid-organic-chunk-normal-01.png",
                premul_alpha = false,
                scale = 0.5,
                size = 50
              },
              roughness_map = {
                filename = "__spaceplatform-block__/graphics/asteroid/chunk/organic/asteroid-organic-chunk-roughness-01.png",
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
    icon = "__spaceplatform-block__/graphics/icons/aquilo-asteroid-chunk.png",
    icon_size = 64,
    minable = {
      mining_particle = "carbonic-asteroid-chunk-particle-medium",
      mining_time = 0.2,
      result = "aquilo-asteroid-chunk"
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
            filename = "__spaceplatform-block__/graphics/asteroid/chunk/aquilo/asteroid-aquilo-chunk-colour-01.png",
            scale = 0.5,
            size = 50
          },
          normal_map = {
            filename = "__spaceplatform-block__/graphics/asteroid/chunk/aquilo/asteroid-aquilo-chunk-normal-01.png",
            premul_alpha = false,
            scale = 0.5,
            size = 50
          },
          roughness_map = {
            filename = "__spaceplatform-block__/graphics/asteroid/chunk/aquilo/asteroid-aquilo-chunk-roughness-01.png",
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
    {--钨矿星岩
      dying_trigger_effect = {
        {
          entity_name = "promethium-asteroid-explosion-1",
          type = "create-entity"
        }
      },
      icon = "__spaceplatform-block__/graphics/icons/tungsten-asteroid-chunk.png",
      icon_size = 64,
      minable = {
        mining_particle = "oxide-asteroid-chunk-particle-medium",
        mining_time = 0.2,
        result = "tungsten-asteroid-chunk"
      },
      name = "tungsten-asteroid-chunk",
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
              filename = "__spaceplatform-block__/graphics/asteroid/chunk/tungsten/asteroid-tungsten-chunk-colour-01.png",
              scale = 0.5,
              size = 50
            },
            normal_map = {
              filename = "__spaceplatform-block__/graphics/asteroid/chunk/tungsten/asteroid-tungsten-chunk-normal-01.png",
              premul_alpha = false,
              scale = 0.5,
              size = 50
            },
            roughness_map = {
              filename = "__spaceplatform-block__/graphics/asteroid/chunk/tungsten/asteroid-tungsten-chunk-roughness-01.png",
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
    {-- 铀矿星岩
     dying_trigger_effect = {
      {
        entity_name = "promethium-asteroid-explosion-1",
        type = "create-entity"
      }
    },
    icon = "__spaceplatform-block__/graphics/icons/uranium-asteroid-chunk.png",
    icon_size = 64,
    minable = {
      mining_particle = "oxide-asteroid-chunk-particle-medium",
      mining_time = 0.2,
      result = "uranium-asteroid-chunk"
    },
    name = "uranium-asteroid-chunk",
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
            filename = "__spaceplatform-block__/graphics/asteroid/chunk/uranium/asteroid-uranium-chunk-colour-01.png",
            scale = 0.5,
            size = 50
          },
          normal_map = {
            filename = "__spaceplatform-block__/graphics/asteroid/chunk/uranium/asteroid-uranium-chunk-normal-01.png",
            premul_alpha = false,
            scale = 0.5,
            size = 50
          },
          roughness_map = {
            filename = "__spaceplatform-block__/graphics/asteroid/chunk/uranium/asteroid-uranium-chunk-roughness-01.png",
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
    {-- 钬矿星岩
      dying_trigger_effect = {
        {
          entity_name = "promethium-asteroid-explosion-1",
          type = "create-entity"
        }
      },
      icon = "__spaceplatform-block__/graphics/icons/holmium-asteroid-chunk.png",
      icon_size = 64,
      minable = {
        mining_particle = "promethium-asteroid-chunk-particle-medium",
        mining_time = 0.2,
        result = "holmium-asteroid-chunk"
      },
      name = "holmium-asteroid-chunk",
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
              filename = "__spaceplatform-block__/graphics/asteroid/chunk/holmium/asteroid-holmium-chunk-colour-01.png",
              scale = 0.5,
              size = 50
            },
            normal_map = {
              filename = "__spaceplatform-block__/graphics/asteroid/chunk/holmium/asteroid-holmium-chunk-normal-01.png",
              premul_alpha = false,
              scale = 0.5,
              size = 50
            },
            roughness_map = {
              filename = "__spaceplatform-block__/graphics/asteroid/chunk/holmium/asteroid-holmium-chunk-roughness-01.png",
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
utils.add_asteroid_to_planet("vulcanus","tungsten","chunk",0.003)
utils.add_asteroid_to_planet("nauvisorbit","uranium","chunk",0.002)
utils.add_asteroid_to_planet("vulcanus","holmium","chunk",0.003)
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
local uranium_asteroid_spawn={
  repeat_count = 1,
  asteroid_name = "uranium-asteroid-chunk",
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
    }
  },
  type = "create-asteroid-chunk",
  probability=0.2
}
local organic_asteroid_spawn={
  repeat_count = 2,
  asteroid_name = "organic-asteroid-chunk",
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
  type = "create-asteroid-chunk",
  probability=0.5
}
local tungsten_asteroid_spawn={
  repeat_count = 5,
  asteroid_name = "tungsten-asteroid-chunk",
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
    }
  },
  type = "create-asteroid-chunk",
  probability=0.2
}
local holmium_asteroid_spawn=table.deepcopy(tungsten_asteroid_spawn)
holmium_asteroid_spawn.asteroid_name="holmium-asteroid-chunk"
table.insert(data.raw.asteroid["big-oxide-asteroid"].dying_trigger_effect,aquilo_asteroid_spawn)
table.insert(data.raw.asteroid["medium-metallic-asteroid"].dying_trigger_effect,uranium_asteroid_spawn)
table.insert(data.raw.asteroid["big-carbonic-asteroid"].dying_trigger_effect,organic_asteroid_spawn)
table.insert(data.raw.asteroid["big-metallic-asteroid"].dying_trigger_effect,tungsten_asteroid_spawn)
table.insert(data.raw.asteroid["big-metallic-asteroid"].dying_trigger_effect,holmium_asteroid_spawn)
for _,asteroid in pairs(data.raw.asteroid)do--调节抗性
  if asteroid.resistances then
    local laser = 100
    local ele_ris = nil
    for _,resistance in pairs(asteroid.resistances)do
      if resistance.type=="fire" then
        resistance.decrease=50
        resistance.percent=70
      elseif resistance.type=="laser" then
        resistance.percent=resistance.percent*3/4
        laser=resistance.percent
      elseif resistance.type=="electric" then
        ele_ris=resistance
      end
    end
    if ele_ris then
      if asteroid.name:byte(1)==115 then
        ele_ris.percent=100
      elseif laser~=100 then
        ele_ris.percent=100-(1.28*(100-laser))
      else ele_ris.percent=0
      end
    end
  end
end