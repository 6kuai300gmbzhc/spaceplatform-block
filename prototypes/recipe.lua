data.raw.recipe["iron-stick"].enabled = true
data.raw.recipe["medium-electric-pole"].enabled = true
data.raw.recipe["iron-bacteria"].order = "e-a-c"
data.raw.recipe["iron-bacteria-cultivation"].order = "e-a-c"
data.raw.recipe["space-platform-foundation"].ingredients = {
  { type = "item", name = "metallic-asteroid-chunk", amount = 1 }
}
data.raw.recipe.shotgun.ingredients = {
  {
    amount = 15,
    name = "iron-plate",
    type = "item"
  },
  {
    amount = 5,
    name = "iron-gear-wheel",
    type = "item"
  },
  {
    amount = 10,
    name = "copper-plate",
    type = "item"
  }
}
data.raw.recipe["agricultural-tower"].ingredients = {
  {
    amount = 10,
    name = "steel-plate",
    type = "item"
  },
  {
    amount = 3,
    name = "electronic-circuit",
    type = "item"
  },
  {
    amount = 20,
    name = "spoilage",
    type = "item"
  },
  {
    amount = 50,
    name = "stone",
    type = "item"
  }
}
data.raw.recipe["biochamber"].ingredients = {
  {
    amount = 5,
    name = "nutrients",
    type = "item"
  },
  {
    amount = 1,
    name = "pentapod-egg",
    type = "item"
  },
  {
    amount = 20,
    name = "iron-plate",
    type = "item"
  },
  {
    amount = 5,
    name = "electronic-circuit",
    type = "item"
  },
  {
    amount = 50,
    name = "stone",
    type = "item"
  }
}
data.raw.recipe["asteroid-collector"].ingredients = {
  {
    amount = 5,
    name = "electronic-circuit",
    type = "item"
  },
  {
    amount = 5,
    name = "engine-unit",
    type = "item"
  },
  {
    amount = 20,
    name = "steel-plate",
    type = "item"
  }
}
data.raw.recipe["metallic-asteroid-crushing"].results = {
  { type = "item", name = "iron-ore",                amount = 10 },
  { type = "item", name = "copper-ore",              amount = 10 },
  { type = "item", name = "metallic-asteroid-chunk", amount = 1, probability = 0.2, ignored_by_productivity = 1 }
}
data:extend({
  {   --太阳火箭发射井
    type = "recipe",
    name = "sol-rocket-silo",
    icon = "__spaceplatform-block__/graphics/icons/sol-rocket-silo.png",
    enabled = false,
    energy_required = 60,
    ingredients = {
      {
        amount = 1,
        name = "rocket-silo",
        type = "item"
      },
      {
        amount = 200,
        name = "tungsten-plate",
        type = "item"
      },
      {
        amount = 100,
        name = "foundation",
        type = "item"
      }
    },
    results = {
      {
        amount = 1,
        name = "sol-rocket-silo",
        type = "item"
      }
    },
  },
  {
    allow_productivity = false,
    category = "rocket-building",
    enabled = false,
    energy_required = 120,
    hide_from_player_crafting = true,
    ingredients = {
      {
        amount = 10,
        name = "quantum-processor",
        type = "item"
      },
      {
        amount = 100,
        name = "low-density-structure",
        type = "item"
      },
      {
        amount = 100,
        name = "holmium-plate",
        type = "item"
      },
      {
        amount = 500,
        name = "rocket-fuel",
        type = "item"
      }
    },
    localised_name = "recipe.sol-rocket-part",
    name = "sol-rocket-part",
    results = {
      {
        amount = 1,
        name = "rocket-part",
        type = "item"
      }
    },
    type = "recipe"
  },
  {   --探空启动包
    type = "recipe",
    name = "mothership_pack",
    icon = "__base__/graphics/icons/satellite.png",
    enabled = false,
    energy_required = 60,
    ingredients = {
      { type = "item", name = "low-density-structure", amount = 100 },
      { type = "item", name = "solar-panel",           amount = 100 },
      { type = "item", name = "accumulator",           amount = 100 },
      { type = "item", name = "radar",                 amount = 5 },
      { type = "item", name = "processing-unit",       amount = 100 },
      { type = "item", name = "rocket-fuel",           amount = 50 }
    },
    results = {
      {
        amount = 1,
        name = "mothership-pack",
        type = "item"
      }
    },
  },
  {   --枢纽
    type = "recipe",
    name = "space-platform-hub",
    icon = "__space-age__/graphics/icons/space-platform-hub.png",
    enabled = false,
    energy_required = 30,
    ingredients = {
      {
        amount = 200,
        name = "concrete",
        type = "item"
      },
      {
        amount = 25,
        name = "steel-plate",
        type = "item"
      },
      {
        amount = 10,
        name = "processing-unit",
        type = "item"
      }
    },
    results = {
      {
        amount = 1,
        name = "space-platform-hub",
        type = "item"
      }
    },
    hidden_in_factoriopedia = true
  },
  {   --简单金属星岩粉碎
    type = "recipe",
    name = "simple-metallic-asteroid-crushing",
    icon = "__spaceplatform-block__/graphics/icons/simple-metallic-asteroid-crushing.png",
    subgroup = "space-crushing",
    order = "b-a-a",
    auto_recycle = false,
    enabled = true,
    energy_required = 4,
    ingredients =
    {
      { type = "item", name = "metallic-asteroid-chunk", amount = 1 }
    },
    results =
    {
      { type = "item", name = "iron-ore", amount = 8 },
      { type = "item", name = "copper-ore", amount = 6 }
    },
    allow_productivity = true,
    allow_decomposition = false
  },
  {   --简单碳质星岩粉碎
    type = "recipe",
    name = "simple-carbonic-asteroid-crushing",
    icon = "__spaceplatform-block__/graphics/icons/simple-carbonic-asteroid-crushing.png",
    subgroup = "space-crushing",
    order = "b-a-b",
    auto_recycle = false,
    enabled = true,
    energy_required = 4,
    ingredients =
    {
      { type = "item", name = "carbonic-asteroid-chunk", amount = 1 }
    },
    results =
    {
      { type = "item", name = "carbon", amount = 6 },
      { type = "item", name = "stone", amount = 5 }
    },
    allow_productivity = true,
    allow_decomposition = false
  },
  {   --简单氧化星岩粉碎
    type = "recipe",
    name = "simple-oxide-asteroid-crushing",
    icon = "__spaceplatform-block__/graphics/icons/simple-oxide-asteroid-crushing.png",
    subgroup = "space-crushing",
    order = "b-a-c",
    auto_recycle = false,
    enabled = true,
    energy_required = 4,
    ingredients =
    {
      { type = "item", name = "oxide-asteroid-chunk", amount = 1 }
    },
    results =
    {
      { type = "item", name = "ice", amount = 4 }
    },
    allow_productivity = true,
    allow_decomposition = false
  },
  {   --有机星岩粉碎
    type = "recipe",
    name = "organic-asteroid-crushing",
    icon = "__spaceplatform-block__/graphics/icons/organic-asteroid-crushing.png",
    subgroup = "space-crushing",
    order = "b-a-d",
    auto_recycle = false,
    enabled = false,
    energy_required = 2,
    ingredients =
    {
      { type = "item", name = "organic-asteroid-chunk", amount = 1 }
    },
    results =
    {
      { type = "item", name = "jellynut-seed", amount = 1, probability = 0.01 },
      { type = "item", name = "yumako-seed", amount = 1, probability = 0.01 },
      { type = "item", name = "pentapod-egg", amount = 1, probability = 0.1, percent_spoiled = 0.8 },
      { type = "item", name = "spoilage",  amount = 10, probability = 0.88 },
      { type = "item", name = "stone",     amount = 10 }
    },
    allow_productivity = true,
    allow_decomposition = false,
    category = "crushing",
  },
  {   --铀矿星岩粉碎
    type = "recipe",
    name = "uranium-asteroid-crushing",
    icon = "__spaceplatform-block__/graphics/icons/uranium-asteroid-crushing.png",
    subgroup = "space-crushing",
    order = "b-a-d",
    auto_recycle = false,
    enabled = false,
    energy_required = 2,
    ingredients =
    {
      { type = "item", name = "uranium-asteroid-chunk", amount = 1 }
    },
    results =
    {
      { type = "item", name = "uranium-ore", amount = 10 }
    },
    allow_productivity = true,
    allow_decomposition = false,
    category = "crushing",
  },
  {   --生物质收集
    type = "recipe",
    name = "organic-solution-gathering",
    icon = "__spaceplatform-block__/graphics/icons/organic-solution-gathering.png",
    subgroup = "space-crushing",
    category = "chemistry",
    order = "b-b-a",
    auto_recycle = false,
    enabled = false,
    energy_required = 5,
    ingredients =
    {
      { type = "item", name = "carbonic-asteroid-chunk", amount = 1 },
      { type = "fluid", name = "water",                  amount = 10 }
    },
    results =
    {
      { type = "fluid", name = "organic-solution",       amount = 100, probability = 0.1 },
      { type = "item", name = "carbonic-asteroid-chunk", amount = 1, probability = 0.7 }
    },
    allow_productivity = false,
    allow_decomposition = false,
    crafting_machine_tint =
    {
      primary = { r = 0.483, g = 0.524, b = 0.156, a = 0.502 },
      secondary = { r = 0.635, g = 0.070, b = 0.302, a = 0.502 },
      tertiary = { r = 0.235, g = 0.400, b = 0.058, a = 0.502 },
      quaternary = { r = 0.174, g = 0.629, b = 0.000, a = 0.502 }
    }
  },
  {   --细菌发现
    type = "recipe",
    name = "bacteria-discovering",
    icon = "__spaceplatform-block__/graphics/icons/bacteria.png",
    category = "organic-or-chemistry",
    subgroup = "agriculture-processes",
    order = "e[bacteria]-a[bacteria]-a",
    enabled = false,
    allow_productivity = true,
    energy_required = 1,
    ingredients =
    {
      { type = "fluid", name = "organic-solution", amount = 10 },
    },
    results =
    {
      { type = "item", name = "bacteria", amount = 1, probability = 0.01 },
    },
    crafting_machine_tint =
    {
      primary = { r = 0.483, g = 0.524, b = 0.156, a = 0.502 },
      secondary = { r = 0.635, g = 0.070, b = 0.302, a = 0.502 },
      tertiary = { r = 0.235, g = 0.400, b = 0.058, a = 0.502 },
      quaternary = { r = 0.174, g = 0.629, b = 0.000, a = 0.502 }
    }
  },
  {   --细菌培养
    type = "recipe",
    name = "bacteria-cultivation",
    icon = "__spaceplatform-block__/graphics/icons/bacteria-cultivation.png",
    category = "organic-or-chemistry",
    subgroup = "agriculture-processes",
    order = "e[bacteria]-b-a",
    enabled = false,
    allow_productivity = true,
    result_is_always_fresh = true,
    energy_required = 4,
    ingredients =
    {
      { type = "fluid", name = "water",    amount = 10 },
      { type = "item",  name = "bacteria", amount = 1 },
      { type = "item",  name = "carbon",   amount = 1 }
    },
    results =
    {
      { type = "item", name = "bacteria", amount = 2, ignored_by_productivity = 1 },
    },
    crafting_machine_tint =
    {
      primary = { r = 0.483, g = 0.524, b = 0.156, a = 0.502 },
      secondary = { r = 0.635, g = 0.070, b = 0.302, a = 0.502 },
      tertiary = { r = 0.235, g = 0.400, b = 0.058, a = 0.502 },
      quaternary = { r = 0.174, g = 0.629, b = 0.000, a = 0.502 }
    }
  },
  {   --细菌提取生物溶剂
    type = "recipe",
    name = "extracting-organic-solution-from-bacteria",
    icon = "__spaceplatform-block__/graphics/icons/organic-solution.png",
    category = "organic-or-chemistry",
    subgroup = "agriculture-processes",
    order = "e[bacteria]-c-b",
    enabled = false,
    allow_productivity = true,
    result_is_always_fresh = true,
    energy_required = 4,
    ingredients =
    {
      { type = "fluid", name = "water",    amount = 10 },
      { type = "item",  name = "bacteria", amount = 1 }
    },
    results =
    {
      { type = "fluid", name = "organic-solution", amount = 250 },
    },
    crafting_machine_tint =
    {
      primary = { r = 0.483, g = 0.524, b = 0.156, a = 0.502 },
      secondary = { r = 0.635, g = 0.070, b = 0.302, a = 0.502 },
      tertiary = { r = 0.235, g = 0.400, b = 0.058, a = 0.502 },
      quaternary = { r = 0.174, g = 0.629, b = 0.000, a = 0.502 }
    }
  },
  {   --碳质星岩定向选择
    type = "recipe",
    name = "carbon-astroid-natural-selecting",
    icon = "__spaceplatform-block__/graphics/icons/carbon-astroid-natural-selecting.png",
    category = "organic-or-chemistry",
    subgroup = "agriculture-processes",
    order = "e[bacteria]-c-c",
    enabled = false,
    allow_productivity = false,
    result_is_always_fresh = true,
    energy_required = 4,
    ingredients =
    {
      { type = "fluid", name = "water",                   amount = 10 },
      { type = "item",  name = "bacteria",                amount = 1 },
      { type = "item",  name = "carbonic-asteroid-chunk", amount = 1 }
    },
    results =
    {
      { type = "item", name = "plastic-bacteria", amount = 1, probability = 0.1 },
      { type = "item", name = "sulfur-bacteria",  amount = 1, probability = 0.1 }
    },
    crafting_machine_tint =
    {
      primary = { r = 0.483, g = 0.524, b = 0.156, a = 0.502 },
      secondary = { r = 0.635, g = 0.070, b = 0.302, a = 0.502 },
      tertiary = { r = 0.235, g = 0.400, b = 0.058, a = 0.502 },
      quaternary = { r = 0.174, g = 0.629, b = 0.000, a = 0.502 }
    }
  }
})
local plastic_crafting_machine_tint = table.deepcopy(data.raw.recipe["plastic-bar"].crafting_machine_tint)
local sulfur_crafting_machine_tint = table.deepcopy(data.raw.recipe["sulfur"].crafting_machine_tint)
local oil_crafting_machine_tint = table.deepcopy(data.raw.recipe["carbon"].crafting_machine_tint)
data:extend({
  { --塑料细菌培养
    type = "recipe",
    name = "plastic-bacteria-cultivation",
    icon = "__spaceplatform-block__/graphics/icons/plastic-bacteria-cultivation.png",
    category = "organic-or-chemistry",
    subgroup = "agriculture-processes",
    order = "e[bacteria]-b-b",
    enabled = false,
    allow_productivity = true,
    result_is_always_fresh = true,
    energy_required = 4,
    ingredients =
    {
      { type = "fluid", name = "organic-solution", amount = 100 },
      { type = "item",  name = "plastic-bacteria", amount = 1 }
    },
    results =
    {
      { type = "item", name = "plastic-bacteria", amount = 1, ignored_by_productivity = 1 },
      { type = "item", name = "plastic-bacteria", amount = 1, probability = 0.2 },
      { type = "item", name = "plastic-bar",      amount = 2 }
    },
    crafting_machine_tint = plastic_crafting_machine_tint
  },
  { --硫细菌培养
    type = "recipe",
    name = "sulfur-bacteria-cultivation",
    icon = "__spaceplatform-block__/graphics/icons/sulfur-bacteria-cultivation.png",
    category = "organic-or-chemistry",
    subgroup = "agriculture-processes",
    order = "e[bacteria]-b-c",
    enabled = false,
    allow_productivity = true,
    result_is_always_fresh = true,
    energy_required = 4,
    ingredients =
    {
      { type = "fluid", name = "organic-solution", amount = 100 },
      { type = "item",  name = "sulfur-bacteria",  amount = 1 }
    },
    results =
    {
      { type = "item", name = "sulfur-bacteria", amount = 1, ignored_by_productivity = 1 },
      { type = "item", name = "sulfur-bacteria", amount = 1, probability = 0.2 },
      { type = "item", name = "sulfur",          amount = 2 }
    },
    crafting_machine_tint = sulfur_crafting_machine_tint
  },
  { --硫细菌转硫酸
    type = "recipe",
    name = "sulfuric-acid-from-bacteria",
    icon = "__spaceplatform-block__/graphics/icons/sulfuric-acid-from-bacteria.png",
    category = "organic-or-chemistry",
    subgroup = "agriculture-processes",
    order = "e[bacteria]-b-c",
    enabled = false,
    allow_productivity = true,
    result_is_always_fresh = true,
    energy_required = 1,
    ingredients =
    {
      { type = "item",  name = "iron-plate",      amount = 1 },
      { type = "item",  name = "sulfur-bacteria", amount = 1 },
      { type = "fluid", name = "water",           amount = 100 }
    },
    results =
    {
      { type = "fluid", name = "sulfuric-acid", amount = 50 }
    },
    crafting_machine_tint = sulfur_crafting_machine_tint
  },
  { --演化为油细菌
    type = "recipe",
    name = "oil-bacteria-evolution",
    icon = "__spaceplatform-block__/graphics/icons/oil-bacteria.png",
    category = "organic-or-chemistry",
    subgroup = "agriculture-processes",
    order = "e[bacteria]-b-d",
    enabled = false,
    allow_productivity = false,
    result_is_always_fresh = true,
    energy_required = 10,
    ingredients =
    {
      { type = "fluid", name = "organic-solution", amount = 300 },
      { type = "item",  name = "plastic-bacteria", amount = 1 },
      { type = "item",  name = "sulfur-bacteria",  amount = 1 }
    },
    results =
    {
      { type = "item", name = "sulfur-bacteria",  amount = 1, probability = 0.6 },
      { type = "item", name = "plastic-bacteria", amount = 1, probability = 0.6 },
      { type = "item", name = "oil-bacteria",     amount = 1, probability = 0.2 }
    },
    crafting_machine_tint = oil_crafting_machine_tint
  },
  { --油细菌培养
    type = "recipe",
    name = "oil-bacteria-cultivation",
    icon = "__spaceplatform-block__/graphics/icons/oil-bacteria-cultivation.png",
    category = "organic-or-chemistry",
    subgroup = "agriculture-processes",
    order = "e[bacteria]-b-e",
    enabled = false,
    allow_productivity = true,
    result_is_always_fresh = true,
    energy_required = 10,
    ingredients =
    {
      { type = "fluid", name = "organic-solution", amount = 100 },
      { type = "item",  name = "oil-bacteria",     amount = 1 }
    },
    results =
    {
      { type = "fluid", name = "crude-oil",    amount = 40 },
      { type = "item",  name = "oil-bacteria", amount = 1, ignored_by_productivity = 1 },
      { type = "item",  name = "oil-bacteria", amount = 1, probability = 0.2 }
    },
    crafting_machine_tint = oil_crafting_machine_tint
  }
})
-- data.raw.recipe["uranium-processing"].ingredients={
--   {type = "item", name = "pitchblende", amount = 1}
-- }
local advanced_metallic_asteroid_crushing = table.deepcopy(data.raw.recipe["advanced-metallic-asteroid-crushing"])
advanced_metallic_asteroid_crushing.category = "metallurgy"
advanced_metallic_asteroid_crushing.results = {
  { type = "fluid", name = "lava", amount = 400 }
}
data.raw.recipe["advanced-metallic-asteroid-crushing"] = advanced_metallic_asteroid_crushing
data:extend {
  { --岩浆提取钨
    type = "recipe",
    name = "tungsten-from-lava",
    icon = "__spaceplatform-block__/graphics/icons/molten-tungsten-from-lava.png",
    category = "metallurgy",
    subgroup = "vulcanus-processes",
    order = "b-c",
    enabled = false,
    allow_productivity = true,
    energy_required = 10,
    ingredients =
    {
      { type = "fluid", name = "lava",                    amount = 500 },
      { type = "item",  name = "tungsten-asteroid-chunk", amount = 1 }
    },
    results =
    {
      { amount = 15, name = "stone",      type = "item" },
      { amount = 10, name = "tungsten-ore", type = "item" }
    }
  }
} --下调回收出种子概率，无法实现增殖（很邪恶）
data.raw.recipe["yumako-processing"].results = {
  {
    amount = 1,
    name = "yumako-seed",
    probability = 0.01,
    type = "item"
  },
  {
    amount = 2,
    name = "yumako-mash",
    type = "item"
  }
}
data.raw.recipe["jellynut-processing"].results = {
  {
    amount = 1,
    name = "jellynut-seed",
    probability = 0.01,
    type = "item"
  },
  {
    amount = 4,
    name = "jelly",
    type = "item"
  }
}
data:extend {
  { --结晶转生物溶剂
    allow_productivity = true,
    category = "organic",
    crafting_machine_tint = {
      primary = {
        a = 1,
        b = 1,
        g = 0.9,
        r = 0.8
      },
      secondary = {
        a = 1,
        b = 0,
        g = 0.13700000000000001,
        r = 0.9
      }
    },
    enabled = false,
    energy_required = 2,
    icon = "__spaceplatform-block__/graphics/icons/organic-solution-from-bioflux.png",
    ingredients = {
      {
        amount = 1,
        name = "bioflux",
        type = "item"
      }
    },
    name = "organic-solution-from-bioflux",
    order = "d-d",
    results = {
      {
        amount = 500,
        name = "organic-solution",
        type = "fluid"
      }
    },
    subgroup = "agriculture-processes",
    type = "recipe"
  }
}
data.raw.recipe["holmium-solution"].ingredients = { --钬矿星岩处理
  {
    amount = 1,
    name = "holmium-asteroid-chunk",
    type = "item"
  },
  {
    amount = 1,
    name = "stone",
    type = "item"
  },
  {
    amount = 10,
    name = "water",
    type = "fluid"
  }
}
for i = 1, 3 do --冰星的星岩处理
  local aquilo_asteroid_recipe = {
    allow_productivity = true,
    category = "oil-processing",
    crafting_machine_tint = {
      primary = {
        a = 1,
        b = 0.25,
        g = 0,
        r = 0
      },
      secondary = {
        a = 1,
        b = 0.5,
        g = 0.13700000000000001,
        r = 0.1
      }
    },
    enabled = false,
    energy_required = 5,
    icon = "__spaceplatform-block__/graphics/icons/aquilo-asteroid-smelting-" .. i .. ".png",
    ingredients = {
      {
        amount = 1,
        name = "aquilo-asteroid-chunk",
        type = "item"
      },
      {
        amount = 300,
        name = "water",
        type = "fluid"
      }
    },
    name = "aquilo-asteroid-smelting-" .. i,
    order = "d-d",
    results = {
    },
    subgroup = "fluid-recipes",
    type = "recipe"
  }
  local aquilo_asteroid_result = {
    {
      amount = 150,
      name = "ammoniacal-solution",
      type = "fluid"
    },
    {
      amount = 150,
      name = "fluorine",
      type = "fluid"
    },
    {
      amount = 150,
      name = "lithium-brine",
      type = "fluid"
    }
  }
  aquilo_asteroid_result[i].amount = 0
  aquilo_asteroid_recipe.results = aquilo_asteroid_result
  -- table.insert(aquilo_asteroid_recipe.results,aquilo_asteroid_result[i>(i)%3+1 and i or (i)%3+1])
  -- table.insert(aquilo_asteroid_recipe.results,aquilo_asteroid_result[i<(i)%3+1 and i or (i)%3+1])
  data:extend { aquilo_asteroid_recipe }
end
for _, i in pairs({ "iron", "copper" }) do --调整铜铁细菌
  data.raw.recipe[i .. "-bacteria"].ingredients = {
    {
      amount = 1,
      name = "oil-bacteria",
      type = "item"
    },
    {
      amount = 10,
      name = i .. "-ore",
      type = "item"
    }
  }
  data.raw.recipe[i .. "-bacteria"].results = {
    {
      amount = 1,
      name = "oil-bacteria",
      type = "item",
      probability = 0.9
    },
    {
      amount = 1,
      name = i .. "-bacteria",
      type = "item",
      probability = 0.1
    }
  }
  data.raw.recipe[i .. "-bacteria-cultivation"].ingredients = {
    {
      amount = 1,
      name = i .. "-bacteria",
      type = "item"
    },
    {
      amount = 1,
      name = "metallic-asteroid-chunk",
      type = "item"
    }
  }
  data.raw.recipe[i .. "-bacteria-cultivation"].results = {
    {
      amount = 1,
      name = i .. "-ore",
      type = "item"
    },
    {
      amount = 1,
      name = "metallic-asteroid-chunk",
      type = "item",
      probability = 0.98,
      ignored_by_productivity = 1
    },
    {
      amount = 1,
      name = i .. "-bacteria",
      type = "item"
    },
    {
      amount = 1,
      name = i .. "-bacteria",
      type = "item",
      probability = 0.2
    }
  }
end
data:extend {
  {
    allow_productivity = true,
    category = "organic-or-hand-crafting",
    crafting_machine_tint = {
      primary = {
        a = 1,
        b = 0.31000000000000001,
        g = 0.006,
        r = 0.97599999999999998
      },
      secondary = {
        a = 1,
        b = 0.29299999999999997,
        g = 0.70099999999999998,
        r = 0.80500000000000007
      }
    },
    enabled = false,
    energy_required = 10,
    icon = "__spaceplatform-block__/graphics/icons/cuttlepop-seed.png",
    ingredients = {
      {
        amount = 2,
        name = "yumako-seed",
        type = "item"
      },
      {
        amount = 50,
        name = "copper-bacteria",
        type = "item"
      }
    },
    name = "cuttlepop-seed",
    order = "a[seeds]-a[yumako-processing]",
    results = {
      {
        amount = 1,
        name = "cuttlepop-seed",
        type = "item"
      }
    },
    subgroup = "agriculture-processes",
    type = "recipe"
  },
  {
    allow_productivity = true,
    category = "organic-or-hand-crafting",
    crafting_machine_tint = {
      primary = {
        a = 1,
        b = 0.69299999999999997,
        g = 0.70099999999999998,
        r = 0.40500000000000007
      },
      secondary = {
        a = 1,
        b = 0.70999999999999996,
        g = 0.40600000000000005,
        r = 0.87599999999999998
      }
    },
    enabled = false,
    energy_required = 10,
    icon = "__spaceplatform-block__/graphics/icons/hairyclubnub-seed.png",
    ingredients = {
      {
        amount = 2,
        name = "jellynut-seed",
        type = "item"
      },
      {
        amount = 50,
        name = "iron-bacteria",
        type = "item"
      }
    },
    name = "hairyclubnub-seed",
    order = "a[seeds]-b[jellynut-processing]",
    results = {
      {
        amount = 1,
        name = "hairyclubnub-seed",
        type = "item"
      }
    },
    subgroup = "agriculture-processes",
    type = "recipe"
  }
}
data.raw.recipe["scrap-recycling"].results = { { amount = 1, name = "scrap1", type = "item" } }
data.raw.recipe["scrap-recycling"].allow_productivity = false --废料回收



--贫铀弹夹和特斯拉弹药
if settings.startup["gamemode"].value ~= "normal" then
  data.raw.recipe["firearm-magazine"].ingredients = {
    {
      amount = 5,
      name = "iron-plate",
      type = "item"
    }
  }
  data.raw.recipe["firearm-magazine"].results = {
    {
      amount = 2,
      name = "firearm-magazine",
      type = "item"
    }
  }
  data.raw.recipe["firearm-magazine"].energy_required = 2
  data.raw.recipe["uranium-rounds-magazine"] = nil
  data.raw.recipe["tesla-ammo"] = nil
  data:extend {
    {
      enabled = false,
      energy_required = 10,
      ingredients = {
        {
          amount = 1,
          name = "uranium-asteroid-chunk",
          type = "item"
        },
        {
          amount = 20,
          name = "iron-plate",
          type = "item"
        }
      },
      name = "uranium-rounds-magazine",
      results = {
        {
          amount = 10,
          name = "uranium-rounds-magazine",
          type = "item"
        }
      },
      type = "recipe"
    },
    {
      enabled = true,
      energy_required = 10,
      ingredients = {
        {
          amount = 2,
          name = "iron-plate",
          type = "item"
        },
        {
          amount = 2,
          name = "copper-plate",
          type = "item"
        }
      },
      name = "tesla-ammo",
      results = {
        {
          amount = 1,
          name = "tesla-ammo",
          type = "item"
        }
      },
      type = "recipe"
    }
  }
end

--反向推进器
local reverse_thruster=table.deepcopy(data.raw.recipe.thruster)
reverse_thruster.results={
  {
    amount = 1,
    name = "reverse-thruster",
    type = "item"
  }
}
reverse_thruster.name="reverse-thruster"
data:extend{reverse_thruster}