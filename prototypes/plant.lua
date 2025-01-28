-- local plants={"yumako-tree","jellystem"}
-- for _,plant in pairs(plants) do
--     local tile_restriction=data.raw["plant"][plant].autoplace.tile_restriction
--     table.insert(tile_restriction,"space-platform-foundation")
-- end
local tree_retrict=data.raw.plant["tree-plant"].autoplace.tile_restriction
table.insert(tree_retrict,"space-platform-foundation")
local space_hairyclubnub = table.deepcopy(data.raw.plant["jellystem"]) --太空果冻果
space_hairyclubnub.name = "space-hairyclubnub"
space_hairyclubnub.subgroup = "trees"
space_hairyclubnub.type = "plant"
space_hairyclubnub.growth_ticks = 36000
space_hairyclubnub.icon = "__space-age__/graphics/icons/hairyclubnub.png"
space_hairyclubnub.factoriopedia_simulation = data.raw.tree.hairyclubnub.factoriopedia_simulation
space_hairyclubnub.autoplace = {
  probability_expression = "0",
  tile_restriction = {
    "space-platform-foundation"
  }
}
space_hairyclubnub.surface_conditions = {
  {
    max = 0,
    min = 0,
    property = "pressure"
  },
  {
    max = 0,
    min = 0,
    property = "gravity"
  }
}
space_hairyclubnub.agricultural_tower_tint = {
  primary = {
    a = 1,
    b = 0.2,
    g = 1,
    r = 0.7
  },
  secondary = {
    a = 1,
    b = 0.30800000000000001,
    g = 0.61299999999999999,
    r = 0.56100000000000003
  }
}
space_hairyclubnub.minable.results = {
  {
    amount = 60,
    name = "jelly",
    type = "item"
  },
  {
    amount = 1,
    name = "hairyclubnub-seed",
    type = "item"
  }
}
local space_cuttlepop = table.deepcopy(data.raw.plant["yumako-tree"]) --我愿称之为太空玉玛果树
space_cuttlepop.name = "space-cuttlepop"
space_cuttlepop.subgroup = "trees"
space_cuttlepop.type = "plant"
space_cuttlepop.growth_ticks = 36000
space_cuttlepop.icon = "__space-age__/graphics/icons/cuttlepop.png"
space_cuttlepop.factoriopedia_simulation = data.raw.tree.cuttlepop.factoriopedia_simulation
space_cuttlepop.autoplace = {
  probability_expression = "0",
  tile_restriction = {
    "space-platform-foundation"
  }
}
space_cuttlepop.surface_conditions = {
  {
    max = 0,
    min = 0,
    property = "pressure"
  },
  {
    max = 0,
    min = 0,
    property = "gravity"
  }
}
space_cuttlepop.agricultural_tower_tint = {
  primary = {
    a = 1,
    b = 0.2,
    g = 1,
    r = 0.7
  },
  secondary = {
    a = 1,
    b = 0.30800000000000001,
    g = 0.61299999999999999,
    r = 0.56100000000000003
  }
}
space_cuttlepop.minable.results = {
  {
    amount = 30,
    name = "yumako-mash",
    type = "item"
  },
  {
    amount = 1,
    name = "cuttlepop-seed",
    type = "item"
  }
}
space_cuttlepop.variations = {
  {
    branch_generation = {
      frame_speed = 0.4,
      initial_height = 2,
      initial_height_deviation = 2,
      initial_vertical_speed = 0.01,
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
      particle_name = "branch-particle",
      repeat_count = 15,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.01,
      type = "create-particle"
    },
    leaf_generation = {
      initial_height = 2,
      initial_height_deviation = 0.05,
      initial_vertical_speed = 0.01,
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
      particle_name = "leaf-particle",
      speed_from_center = 0.01,
      speed_from_center_deviation = 0.01,
      type = "create-particle"
    },
    leaves = {
      filename = "__spaceplatform-block__/graphics/plant/cuttlepop/cuttlepop-harvest.png",
      frame_count = 1,
      height = 560,
      scale = 0.33000000000000003,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 0,
      y = 0
    },
    normal = {
      filename = "__spaceplatform-block__/graphics/plant/cuttlepop/cuttlepop-normal.png",
      frame_count = 1,
      height = 560,
      scale = 0.33000000000000003,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 0,
      y = 0
    },
    shadow = {
      filenames = {
        "__spaceplatform-block__/graphics/plant/cuttlepop/cuttlepop-harvest-shadow.png",
        "__spaceplatform-block__/graphics/plant/cuttlepop/cuttlepop-shadow.png"
      },
      frame_count = 2,
      height = 560,
      line_length = 1,
      lines_per_file = 1,
      scale = 0.33000000000000003,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 0,
      y = 0
    },
    trunk = {
      filename = "__spaceplatform-block__/graphics/plant/cuttlepop/cuttlepop-trunk.png",
      frame_count = 1,
      height = 560,
      scale = 0.33000000000000003,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 0,
      y = 0
    }
  },
  {
    branch_generation = {
      frame_speed = 0.4,
      initial_height = 2,
      initial_height_deviation = 2,
      initial_vertical_speed = 0.01,
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
      particle_name = "branch-particle",
      repeat_count = 15,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.01,
      type = "create-particle"
    },
    leaf_generation = {
      initial_height = 2,
      initial_height_deviation = 0.05,
      initial_vertical_speed = 0.01,
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
      particle_name = "leaf-particle",
      speed_from_center = 0.01,
      speed_from_center_deviation = 0.01,
      type = "create-particle"
    },
    leaves = {
      filename = "__spaceplatform-block__/graphics/plant/cuttlepop/cuttlepop-harvest.png",
      frame_count = 1,
      height = 560,
      scale = 0.33000000000000003,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 640,
      y = 0
    },
    normal = {
      filename = "__spaceplatform-block__/graphics/plant/cuttlepop/cuttlepop-normal.png",
      frame_count = 1,
      height = 560,
      scale = 0.33000000000000003,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 640,
      y = 0
    },
    shadow = {
      filenames = {
        "__spaceplatform-block__/graphics/plant/cuttlepop/cuttlepop-harvest-shadow.png",
        "__spaceplatform-block__/graphics/plant/cuttlepop/cuttlepop-shadow.png"
      },
      frame_count = 2,
      height = 560,
      line_length = 1,
      lines_per_file = 1,
      scale = 0.33000000000000003,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 640,
      y = 0
    },
    trunk = {
      filename = "__spaceplatform-block__/graphics/plant/cuttlepop/cuttlepop-trunk.png",
      frame_count = 1,
      height = 560,
      scale = 0.33000000000000003,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 640,
      y = 0
    }
  },
  {
    branch_generation = {
      frame_speed = 0.4,
      initial_height = 2,
      initial_height_deviation = 2,
      initial_vertical_speed = 0.01,
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
      particle_name = "branch-particle",
      repeat_count = 15,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.01,
      type = "create-particle"
    },
    leaf_generation = {
      initial_height = 2,
      initial_height_deviation = 0.05,
      initial_vertical_speed = 0.01,
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
      particle_name = "leaf-particle",
      speed_from_center = 0.01,
      speed_from_center_deviation = 0.01,
      type = "create-particle"
    },
    leaves = {
      filename = "__spaceplatform-block__/graphics/plant/cuttlepop/cuttlepop-harvest.png",
      frame_count = 1,
      height = 560,
      scale = 0.33000000000000003,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 1280,
      y = 0
    },
    normal = {
      filename = "__spaceplatform-block__/graphics/plant/cuttlepop/cuttlepop-normal.png",
      frame_count = 1,
      height = 560,
      scale = 0.33000000000000003,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 1280,
      y = 0
    },
    shadow = {
      filenames = {
        "__spaceplatform-block__/graphics/plant/cuttlepop/cuttlepop-harvest-shadow.png",
        "__spaceplatform-block__/graphics/plant/cuttlepop/cuttlepop-shadow.png"
      },
      frame_count = 2,
      height = 560,
      line_length = 1,
      lines_per_file = 1,
      scale = 0.33000000000000003,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 1280,
      y = 0
    },
    trunk = {
      filename = "__spaceplatform-block__/graphics/plant/cuttlepop/cuttlepop-trunk.png",
      frame_count = 1,
      height = 560,
      scale = 0.33000000000000003,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 1280,
      y = 0
    }
  },
  {
    branch_generation = {
      frame_speed = 0.4,
      initial_height = 2,
      initial_height_deviation = 2,
      initial_vertical_speed = 0.01,
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
      particle_name = "branch-particle",
      repeat_count = 15,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.01,
      type = "create-particle"
    },
    leaf_generation = {
      initial_height = 2,
      initial_height_deviation = 0.05,
      initial_vertical_speed = 0.01,
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
      particle_name = "leaf-particle",
      speed_from_center = 0.01,
      speed_from_center_deviation = 0.01,
      type = "create-particle"
    },
    leaves = {
      filename = "__spaceplatform-block__/graphics/plant/cuttlepop/cuttlepop-harvest.png",
      frame_count = 1,
      height = 560,
      scale = 0.33000000000000003,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 1920,
      y = 0
    },
    normal = {
      filename = "__spaceplatform-block__/graphics/plant/cuttlepop/cuttlepop-normal.png",
      frame_count = 1,
      height = 560,
      scale = 0.33000000000000003,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 1920,
      y = 0
    },
    shadow = {
      filenames = {
        "__spaceplatform-block__/graphics/plant/cuttlepop/cuttlepop-harvest-shadow.png",
        "__spaceplatform-block__/graphics/plant/cuttlepop/cuttlepop-shadow.png"
      },
      frame_count = 2,
      height = 560,
      line_length = 1,
      lines_per_file = 1,
      scale = 0.33000000000000003,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 1920,
      y = 0
    },
    trunk = {
      filename = "__spaceplatform-block__/graphics/plant/cuttlepop/cuttlepop-trunk.png",
      frame_count = 1,
      height = 560,
      scale = 0.33000000000000003,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 1920,
      y = 0
    }
  },
  {
    branch_generation = {
      frame_speed = 0.4,
      initial_height = 2,
      initial_height_deviation = 2,
      initial_vertical_speed = 0.01,
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
      particle_name = "branch-particle",
      repeat_count = 15,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.01,
      type = "create-particle"
    },
    leaf_generation = {
      initial_height = 2,
      initial_height_deviation = 0.05,
      initial_vertical_speed = 0.01,
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
      particle_name = "leaf-particle",
      speed_from_center = 0.01,
      speed_from_center_deviation = 0.01,
      type = "create-particle"
    },
    leaves = {
      filename = "__spaceplatform-block__/graphics/plant/cuttlepop/cuttlepop-harvest.png",
      frame_count = 1,
      height = 560,
      scale = 0.33000000000000003,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 0,
      y = 560
    },
    normal = {
      filename = "__spaceplatform-block__/graphics/plant/cuttlepop/cuttlepop-normal.png",
      frame_count = 1,
      height = 560,
      scale = 0.33000000000000003,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 0,
      y = 560
    },
    shadow = {
      filenames = {
        "__spaceplatform-block__/graphics/plant/cuttlepop/cuttlepop-harvest-shadow.png",
        "__spaceplatform-block__/graphics/plant/cuttlepop/cuttlepop-shadow.png"
      },
      frame_count = 2,
      height = 560,
      line_length = 1,
      lines_per_file = 1,
      scale = 0.33000000000000003,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 0,
      y = 560
    },
    trunk = {
      filename = "__spaceplatform-block__/graphics/plant/cuttlepop/cuttlepop-trunk.png",
      frame_count = 1,
      height = 560,
      scale = 0.33000000000000003,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 0,
      y = 560
    }
  }
}
space_hairyclubnub.variations = {
  {
    branch_generation = {
      frame_speed = 0.4,
      initial_height = 2,
      initial_height_deviation = 2,
      initial_vertical_speed = 0.01,
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
      particle_name = "branch-particle",
      repeat_count = 15,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.01,
      type = "create-particle"
    },
    leaf_generation = {
      initial_height = 2,
      initial_height_deviation = 0.05,
      initial_vertical_speed = 0.01,
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
      particle_name = "leaf-particle",
      speed_from_center = 0.01,
      speed_from_center_deviation = 0.01,
      type = "create-particle"
    },
    leaves = {
      filename = "__spaceplatform-block__/graphics/plant/hairyclubnub/hairyclubnub-harvest.png",
      frame_count = 1,
      height = 560,
      scale = 0.42900000000000009,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 0,
      y = 0
    },
    normal = {
      filename = "__spaceplatform-block__/graphics/plant/hairyclubnub/hairyclubnub-normal.png",
      frame_count = 1,
      height = 560,
      scale = 0.42900000000000009,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 0,
      y = 0
    },
    shadow = {
      filenames = {
        "__spaceplatform-block__/graphics/plant/hairyclubnub/hairyclubnub-harvest-shadow.png",
        "__spaceplatform-block__/graphics/plant/hairyclubnub/hairyclubnub-shadow.png"
      },
      frame_count = 2,
      height = 560,
      line_length = 1,
      lines_per_file = 1,
      scale = 0.42900000000000009,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 0,
      y = 0
    },
    trunk = {
      filename = "__spaceplatform-block__/graphics/plant/hairyclubnub/hairyclubnub-trunk.png",
      frame_count = 1,
      height = 560,
      scale = 0.42900000000000009,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 0,
      y = 0
    }
  },
  {
    branch_generation = {
      frame_speed = 0.4,
      initial_height = 2,
      initial_height_deviation = 2,
      initial_vertical_speed = 0.01,
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
      particle_name = "branch-particle",
      repeat_count = 15,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.01,
      type = "create-particle"
    },
    leaf_generation = {
      initial_height = 2,
      initial_height_deviation = 0.05,
      initial_vertical_speed = 0.01,
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
      particle_name = "leaf-particle",
      speed_from_center = 0.01,
      speed_from_center_deviation = 0.01,
      type = "create-particle"
    },
    leaves = {
      filename = "__spaceplatform-block__/graphics/plant/hairyclubnub/hairyclubnub-harvest.png",
      frame_count = 1,
      height = 560,
      scale = 0.42900000000000009,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 640,
      y = 0
    },
    normal = {
      filename = "__spaceplatform-block__/graphics/plant/hairyclubnub/hairyclubnub-normal.png",
      frame_count = 1,
      height = 560,
      scale = 0.42900000000000009,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 640,
      y = 0
    },
    shadow = {
      filenames = {
        "__spaceplatform-block__/graphics/plant/hairyclubnub/hairyclubnub-harvest-shadow.png",
        "__spaceplatform-block__/graphics/plant/hairyclubnub/hairyclubnub-shadow.png"
      },
      frame_count = 2,
      height = 560,
      line_length = 1,
      lines_per_file = 1,
      scale = 0.42900000000000009,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 640,
      y = 0
    },
    trunk = {
      filename = "__spaceplatform-block__/graphics/plant/hairyclubnub/hairyclubnub-trunk.png",
      frame_count = 1,
      height = 560,
      scale = 0.42900000000000009,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 640,
      y = 0
    }
  },
  {
    branch_generation = {
      frame_speed = 0.4,
      initial_height = 2,
      initial_height_deviation = 2,
      initial_vertical_speed = 0.01,
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
      particle_name = "branch-particle",
      repeat_count = 15,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.01,
      type = "create-particle"
    },
    leaf_generation = {
      initial_height = 2,
      initial_height_deviation = 0.05,
      initial_vertical_speed = 0.01,
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
      particle_name = "leaf-particle",
      speed_from_center = 0.01,
      speed_from_center_deviation = 0.01,
      type = "create-particle"
    },
    leaves = {
      filename = "__spaceplatform-block__/graphics/plant/hairyclubnub/hairyclubnub-harvest.png",
      frame_count = 1,
      height = 560,
      scale = 0.42900000000000009,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 1280,
      y = 0
    },
    normal = {
      filename = "__spaceplatform-block__/graphics/plant/hairyclubnub/hairyclubnub-normal.png",
      frame_count = 1,
      height = 560,
      scale = 0.42900000000000009,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 1280,
      y = 0
    },
    shadow = {
      filenames = {
        "__spaceplatform-block__/graphics/plant/hairyclubnub/hairyclubnub-harvest-shadow.png",
        "__spaceplatform-block__/graphics/plant/hairyclubnub/hairyclubnub-shadow.png"
      },
      frame_count = 2,
      height = 560,
      line_length = 1,
      lines_per_file = 1,
      scale = 0.42900000000000009,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 1280,
      y = 0
    },
    trunk = {
      filename = "__spaceplatform-block__/graphics/plant/hairyclubnub/hairyclubnub-trunk.png",
      frame_count = 1,
      height = 560,
      scale = 0.42900000000000009,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 1280,
      y = 0
    }
  },
  {
    branch_generation = {
      frame_speed = 0.4,
      initial_height = 2,
      initial_height_deviation = 2,
      initial_vertical_speed = 0.01,
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
      particle_name = "branch-particle",
      repeat_count = 15,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.01,
      type = "create-particle"
    },
    leaf_generation = {
      initial_height = 2,
      initial_height_deviation = 0.05,
      initial_vertical_speed = 0.01,
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
      particle_name = "leaf-particle",
      speed_from_center = 0.01,
      speed_from_center_deviation = 0.01,
      type = "create-particle"
    },
    leaves = {
      filename = "__spaceplatform-block__/graphics/plant/hairyclubnub/hairyclubnub-harvest.png",
      frame_count = 1,
      height = 560,
      scale = 0.42900000000000009,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 1920,
      y = 0
    },
    normal = {
      filename = "__spaceplatform-block__/graphics/plant/hairyclubnub/hairyclubnub-normal.png",
      frame_count = 1,
      height = 560,
      scale = 0.42900000000000009,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 1920,
      y = 0
    },
    shadow = {
      filenames = {
        "__spaceplatform-block__/graphics/plant/hairyclubnub/hairyclubnub-harvest-shadow.png",
        "__spaceplatform-block__/graphics/plant/hairyclubnub/hairyclubnub-shadow.png"
      },
      frame_count = 2,
      height = 560,
      line_length = 1,
      lines_per_file = 1,
      scale = 0.42900000000000009,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 1920,
      y = 0
    },
    trunk = {
      filename = "__spaceplatform-block__/graphics/plant/hairyclubnub/hairyclubnub-trunk.png",
      frame_count = 1,
      height = 560,
      scale = 0.42900000000000009,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 1920,
      y = 0
    }
  },
  {
    branch_generation = {
      frame_speed = 0.4,
      initial_height = 2,
      initial_height_deviation = 2,
      initial_vertical_speed = 0.01,
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
      particle_name = "branch-particle",
      repeat_count = 15,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.01,
      type = "create-particle"
    },
    leaf_generation = {
      initial_height = 2,
      initial_height_deviation = 0.05,
      initial_vertical_speed = 0.01,
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
      particle_name = "leaf-particle",
      speed_from_center = 0.01,
      speed_from_center_deviation = 0.01,
      type = "create-particle"
    },
    leaves = {
      filename = "__spaceplatform-block__/graphics/plant/hairyclubnub/hairyclubnub-harvest.png",
      frame_count = 1,
      height = 560,
      scale = 0.42900000000000009,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 0,
      y = 560
    },
    normal = {
      filename = "__spaceplatform-block__/graphics/plant/hairyclubnub/hairyclubnub-normal.png",
      frame_count = 1,
      height = 560,
      scale = 0.42900000000000009,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 0,
      y = 560
    },
    shadow = {
      filenames = {
        "__spaceplatform-block__/graphics/plant/hairyclubnub/hairyclubnub-harvest-shadow.png",
        "__spaceplatform-block__/graphics/plant/hairyclubnub/hairyclubnub-shadow.png"
      },
      frame_count = 2,
      height = 560,
      line_length = 1,
      lines_per_file = 1,
      scale = 0.42900000000000009,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 0,
      y = 560
    },
    trunk = {
      filename = "__spaceplatform-block__/graphics/plant/hairyclubnub/hairyclubnub-trunk.png",
      frame_count = 1,
      height = 560,
      scale = 0.42900000000000009,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 0,
      y = 560
    }
  },
  {
    branch_generation = {
      frame_speed = 0.4,
      initial_height = 2,
      initial_height_deviation = 2,
      initial_vertical_speed = 0.01,
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
      particle_name = "branch-particle",
      repeat_count = 15,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.01,
      type = "create-particle"
    },
    leaf_generation = {
      initial_height = 2,
      initial_height_deviation = 0.05,
      initial_vertical_speed = 0.01,
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
      particle_name = "leaf-particle",
      speed_from_center = 0.01,
      speed_from_center_deviation = 0.01,
      type = "create-particle"
    },
    leaves = {
      filename = "__spaceplatform-block__/graphics/plant/hairyclubnub/hairyclubnub-harvest.png",
      frame_count = 1,
      height = 560,
      scale = 0.42900000000000009,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 640,
      y = 560
    },
    normal = {
      filename = "__spaceplatform-block__/graphics/plant/hairyclubnub/hairyclubnub-normal.png",
      frame_count = 1,
      height = 560,
      scale = 0.42900000000000009,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 640,
      y = 560
    },
    shadow = {
      filenames = {
        "__spaceplatform-block__/graphics/plant/hairyclubnub/hairyclubnub-harvest-shadow.png",
        "__spaceplatform-block__/graphics/plant/hairyclubnub/hairyclubnub-shadow.png"
      },
      frame_count = 2,
      height = 560,
      line_length = 1,
      lines_per_file = 1,
      scale = 0.42900000000000009,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 640,
      y = 560
    },
    trunk = {
      filename = "__spaceplatform-block__/graphics/plant/hairyclubnub/hairyclubnub-trunk.png",
      frame_count = 1,
      height = 560,
      scale = 0.42900000000000009,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 640,
      y = 560
    }
  },
  {
    branch_generation = {
      frame_speed = 0.4,
      initial_height = 2,
      initial_height_deviation = 2,
      initial_vertical_speed = 0.01,
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
      particle_name = "branch-particle",
      repeat_count = 15,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.01,
      type = "create-particle"
    },
    leaf_generation = {
      initial_height = 2,
      initial_height_deviation = 0.05,
      initial_vertical_speed = 0.01,
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
      particle_name = "leaf-particle",
      speed_from_center = 0.01,
      speed_from_center_deviation = 0.01,
      type = "create-particle"
    },
    leaves = {
      filename = "__spaceplatform-block__/graphics/plant/hairyclubnub/hairyclubnub-harvest.png",
      frame_count = 1,
      height = 560,
      scale = 0.42900000000000009,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 1280,
      y = 560
    },
    normal = {
      filename = "__spaceplatform-block__/graphics/plant/hairyclubnub/hairyclubnub-normal.png",
      frame_count = 1,
      height = 560,
      scale = 0.42900000000000009,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 1280,
      y = 560
    },
    shadow = {
      filenames = {
        "__spaceplatform-block__/graphics/plant/hairyclubnub/hairyclubnub-harvest-shadow.png",
        "__spaceplatform-block__/graphics/plant/hairyclubnub/hairyclubnub-shadow.png"
      },
      frame_count = 2,
      height = 560,
      line_length = 1,
      lines_per_file = 1,
      scale = 0.42900000000000009,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 1280,
      y = 560
    },
    trunk = {
      filename = "__spaceplatform-block__/graphics/plant/hairyclubnub/hairyclubnub-trunk.png",
      frame_count = 1,
      height = 560,
      scale = 0.42900000000000009,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 1280,
      y = 560
    }
  },
  {
    branch_generation = {
      frame_speed = 0.4,
      initial_height = 2,
      initial_height_deviation = 2,
      initial_vertical_speed = 0.01,
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
      particle_name = "branch-particle",
      repeat_count = 15,
      speed_from_center = 0.03,
      speed_from_center_deviation = 0.01,
      type = "create-particle"
    },
    leaf_generation = {
      initial_height = 2,
      initial_height_deviation = 0.05,
      initial_vertical_speed = 0.01,
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
      particle_name = "leaf-particle",
      speed_from_center = 0.01,
      speed_from_center_deviation = 0.01,
      type = "create-particle"
    },
    leaves = {
      filename = "__spaceplatform-block__/graphics/plant/hairyclubnub/hairyclubnub-harvest.png",
      frame_count = 1,
      height = 560,
      scale = 0.42900000000000009,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 1920,
      y = 560
    },
    normal = {
      filename = "__spaceplatform-block__/graphics/plant/hairyclubnub/hairyclubnub-normal.png",
      frame_count = 1,
      height = 560,
      scale = 0.42900000000000009,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 1920,
      y = 560
    },
    shadow = {
      filenames = {
        "__spaceplatform-block__/graphics/plant/hairyclubnub/hairyclubnub-harvest-shadow.png",
        "__spaceplatform-block__/graphics/plant/hairyclubnub/hairyclubnub-shadow.png"
      },
      frame_count = 2,
      height = 560,
      line_length = 1,
      lines_per_file = 1,
      scale = 0.42900000000000009,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 1920,
      y = 560
    },
    trunk = {
      filename = "__spaceplatform-block__/graphics/plant/hairyclubnub/hairyclubnub-trunk.png",
      frame_count = 1,
      height = 560,
      scale = 0.42900000000000009,
      shift = {
        1.625,
        -1.25
      },
      width = 640,
      x = 1920,
      y = 560
    }
  }
}
data:extend {
  space_cuttlepop, space_hairyclubnub
}
