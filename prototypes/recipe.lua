data.raw.recipe["iron-stick"].enabled = true
data.raw.recipe["medium-electric-pole"].enabled = true
data.raw.recipe["iron-bacteria"].order="e-a-c"
data.raw.recipe["iron-bacteria-cultivation"].order="e-a-c"
data.raw.recipe["space-platform-foundation"].ingredients={
  {type = "item", name = "metallic-asteroid-chunk", amount = 1}
}
data:extend({
    {--简单金属星岩粉碎
        type = "recipe",
        name = "simple-metallic-asteroid-crushing",
        icon = "__spaceship-beginning__/graphics/icons/simple-metallic-asteroid-crushing.png",
        subgroup = "space-crushing",
        order = "b-a-a",
        auto_recycle = false,
        enabled = true,
        energy_required = 5,
        ingredients =
        {
          {type = "item", name = "metallic-asteroid-chunk", amount = 1}
        },
        results=
        {
          {type="item", name="iron-ore", amount=5},
          {type="item", name="copper-ore", amount=2},
          {type="item", name="stone", amount=5}
        },
        allow_productivity = true,
        allow_decomposition = false
    },
    {--简单碳质星岩粉碎
        type = "recipe",
        name = "simple-carbonic-asteroid-crushing",
        icon = "__spaceship-beginning__/graphics/icons/simple-carbonic-asteroid-crushing.png",
        subgroup = "space-crushing",
        order = "b-a-b",
        auto_recycle = false,
        enabled = true,
        energy_required = 5,
        ingredients =
        {
          {type = "item", name = "carbonic-asteroid-chunk", amount = 1}
        },
        results=
        {
          {type="item", name="carbon", amount=2}
        },
        allow_productivity = true,
        allow_decomposition = false
    },
    {--简单氧化星岩粉碎
        type = "recipe",
        name = "simple-oxide-asteroid-crushing",
        icon = "__spaceship-beginning__/graphics/icons/simple-oxide-asteroid-crushing.png",
        subgroup = "space-crushing",
        order = "b-a-c",
        auto_recycle = false,
        enabled = true,
        energy_required = 5,
        ingredients =
        {
          {type = "item", name = "oxide-asteroid-chunk", amount = 1}
        },
        results=
        {
          {type="item", name="ice", amount=1}
        },
        allow_productivity = true,
        allow_decomposition = false
    },
    {--有机星岩粉碎
        type = "recipe",
        name = "organic-asteroid-crushing",
        icon = "__spaceship-beginning__/graphics/icons/organic-asteroid-crushing.png",
        subgroup = "space-crushing",
        order = "b-a-d",
        auto_recycle = false,
        enabled = false,
        energy_required = 2,
        ingredients =
        {
          {type = "item", name = "organic-asteroid-chunk", amount = 1}
        },
        results=
        {
          {type="item", name="jellynut-seed", amount=1,probability=0.01},
          {type="item", name="yumako-seed", amount=1,probability=0.01},
          {type="item", name="pentapod-egg", amount=1,probability=0.1,percent_spoiled = 0.8},
          {type="item", name="spoilage", amount=10,probability=0.88}
        },
        allow_productivity = true,
        allow_decomposition = false,
        category = "crushing",
    },
    {--生物质收集
        type = "recipe",
        name = "organic-solution-gathering",
        icon = "__spaceship-beginning__/graphics/icons/organic-solution-gathering.png",
        subgroup = "space-crushing",
        category = "chemistry",
        order = "b-b-a",
        auto_recycle = false,
        enabled = false,
        energy_required = 5,
        ingredients =
        {
          {type = "item", name = "carbonic-asteroid-chunk", amount = 1},
          {type="fluid", name="water", amount=10}
        },
        results=
        {
          {type="fluid", name="organic-solution", amount=100,probability=0.1},
          {type = "item", name = "carbonic-asteroid-chunk", amount = 1,probability=0.7}
        },
        allow_productivity = false,
        allow_decomposition = false,
        crafting_machine_tint =
        {
            primary = {r=0.483, g=0.524, b=0.156, a = 0.502}, 
            secondary = {r = 0.635, g = 0.070, b = 0.302, a = 0.502},
            tertiary = {r = 0.235, g = 0.400, b = 0.058, a = 0.502},
            quaternary = {r = 0.174, g = 0.629, b = 0.000, a = 0.502}
        }
    },
    {--细菌发现
      type = "recipe",
      name = "bacteria-discovering",
      icon = "__spaceship-beginning__/graphics/icons/bacteria.png",
      category = "organic-or-chemistry",
      subgroup = "agriculture-processes",
      order = "e[bacteria]-a[bacteria]-a",
      enabled = false,
      allow_productivity = true,
      energy_required = 1,
      ingredients =
      {
        {type = "fluid", name = "organic-solution", amount = 10},
      },
      results =
      {
        {type = "item", name = "bacteria", amount = 1, probability = 0.01 },
      },
      crafting_machine_tint =
      {
        primary = {r=0.483, g=0.524, b=0.156, a = 0.502}, 
        secondary = {r = 0.635, g = 0.070, b = 0.302, a = 0.502},
        tertiary = {r = 0.235, g = 0.400, b = 0.058, a = 0.502},
        quaternary = {r = 0.174, g = 0.629, b = 0.000, a = 0.502}
    }
    },
    {--细菌培养
      type = "recipe",
      name = "bacteria-cultivation",
      icon = "__spaceship-beginning__/graphics/icons/bacteria-cultivation.png",
      category = "organic-or-chemistry",
      subgroup = "agriculture-processes",
      order = "e[bacteria]-b-a",
      enabled = false,
      allow_productivity = true,
      result_is_always_fresh = true,
      energy_required = 4,
      ingredients =
      {
        {type = "fluid", name = "water", amount = 10},
        {type = "item", name = "bacteria", amount = 1},
        {type = "item", name = "carbon", amount = 1}
      },
      results =
      {
        {type = "item", name = "bacteria", amount = 2},
      },
      crafting_machine_tint =
      {
        primary = {r=0.483, g=0.524, b=0.156, a = 0.502}, 
        secondary = {r = 0.635, g = 0.070, b = 0.302, a = 0.502},
        tertiary = {r = 0.235, g = 0.400, b = 0.058, a = 0.502},
        quaternary = {r = 0.174, g = 0.629, b = 0.000, a = 0.502}
    }   
    },
    {--细菌提取生物溶剂
      type = "recipe",
      name = "extracting-organic-solution-from-bacteria",
      icon = "__spaceship-beginning__/graphics/icons/organic-solution.png",
      category = "organic-or-chemistry",
      subgroup = "agriculture-processes",
      order = "e[bacteria]-c-b",
      enabled = false,
      allow_productivity = true,
      result_is_always_fresh = true,
      energy_required = 4,
      ingredients =
      {
        {type = "fluid", name = "water", amount = 10},
        {type = "item", name = "bacteria", amount = 1}
      },
      results =
      {
        {type = "fluid", name = "organic-solution", amount = 250},
      },
      crafting_machine_tint =
      {
        primary = {r=0.483, g=0.524, b=0.156, a = 0.502}, 
        secondary = {r = 0.635, g = 0.070, b = 0.302, a = 0.502},
        tertiary = {r = 0.235, g = 0.400, b = 0.058, a = 0.502},
        quaternary = {r = 0.174, g = 0.629, b = 0.000, a = 0.502}
    }   
    },
    {--碳质星岩定向选择
      type = "recipe",
      name = "carbon-astroid-natural-selecting",
      icon = "__spaceship-beginning__/graphics/icons/carbon-astroid-natural-selecting.png",
      category = "organic-or-chemistry",
      subgroup = "agriculture-processes",
      order = "e[bacteria]-c-c",
      enabled = false,
      allow_productivity = false,
      result_is_always_fresh = true,
      energy_required = 4,
      ingredients =
      {
        {type = "fluid", name = "water", amount = 10},
        {type = "item", name = "bacteria", amount = 1},
        {type = "item", name = "carbonic-asteroid-chunk", amount = 1}
      },
      results =
      {
        {type = "item", name = "plastic-bacteria", amount = 1,probability=0.1},
        {type = "item", name = "sulfur-bacteria", amount = 1,probability=0.1}
      },
      crafting_machine_tint =
      {
        primary = {r=0.483, g=0.524, b=0.156, a = 0.502}, 
        secondary = {r = 0.635, g = 0.070, b = 0.302, a = 0.502},
        tertiary = {r = 0.235, g = 0.400, b = 0.058, a = 0.502},
        quaternary = {r = 0.174, g = 0.629, b = 0.000, a = 0.502}
    }   
    }
})
local plastic_crafting_machine_tint=table.deepcopy(data.raw.recipe["plastic-bar"].crafting_machine_tint)
local sulfur_crafting_machine_tint=table.deepcopy(data.raw.recipe["sulfur"].crafting_machine_tint)
local oil_crafting_machine_tint=table.deepcopy(data.raw.recipe["carbon"].crafting_machine_tint)
data:extend({
  {--塑料细菌培养
    type = "recipe",
    name = "plastic-bacteria-cultivation",
    icon = "__spaceship-beginning__/graphics/icons/plastic-bacteria-cultivation.png",
    category = "organic-or-chemistry",
    subgroup = "agriculture-processes",
    order = "e[bacteria]-b-b",
    enabled = false,
    allow_productivity = true,
    result_is_always_fresh = true,
    energy_required = 4,
    ingredients =
    {
      {type = "fluid", name = "organic-solution", amount = 100},
      {type = "item", name = "plastic-bacteria", amount = 1}
    },
    results =
    {
      {type = "item", name = "plastic-bacteria", amount_min = 1,amount_max=2,probability=0.8},
      {type = "item", name = "plastic-bar", amount = 2}
    },
    crafting_machine_tint =plastic_crafting_machine_tint 
  },
  {--硫细菌培养
    type = "recipe",
    name = "sulfur-bacteria-cultivation",
    icon = "__spaceship-beginning__/graphics/icons/sulfur-bacteria-cultivation.png",
    category = "organic-or-chemistry",
    subgroup = "agriculture-processes",
    order = "e[bacteria]-b-c",
    enabled = false,
    allow_productivity = true,
    result_is_always_fresh = true,
    energy_required = 4,
    ingredients =
    {
      {type = "fluid", name = "organic-solution", amount = 100},
      {type = "item", name = "sulfur-bacteria", amount = 1}
    },
    results =
    {
      {type = "item", name = "sulfur-bacteria", amount_min = 1,amount_max=2,probability=0.8},
      {type = "item", name = "sulfur", amount = 2}
    },
    crafting_machine_tint =sulfur_crafting_machine_tint
  },
  {--演化为油细菌
    type = "recipe",
    name = "oil-bacteria-evolution",
    icon = "__spaceship-beginning__/graphics/icons/oil-bacteria.png",
    category = "organic-or-chemistry",
    subgroup = "agriculture-processes",
    order = "e[bacteria]-b-d",
    enabled = false,
    allow_productivity = false,
    result_is_always_fresh = true,
    energy_required = 10,
    ingredients =
    {
      {type = "fluid", name = "organic-solution", amount = 300},
      {type = "item", name = "plastic-bacteria", amount = 1},
      {type = "item", name = "sulfur-bacteria", amount = 1}
    },
    results =
    {
      {type = "item", name = "sulfur-bacteria", amount = 1,probability=0.6},
      {type = "item", name = "plastic-bacteria", amount = 1,probability=0.6},
      {type = "item", name = "oil-bacteria", amount = 1,probability=0.2}
    },
    crafting_machine_tint =oil_crafting_machine_tint
  },
  {--油细菌培养
    type = "recipe",
    name = "oil-bacteria-cultivation",
    icon = "__spaceship-beginning__/graphics/icons/oil-bacteria-cultivation.png",
    category = "organic-or-chemistry",
    subgroup = "agriculture-processes",
    order = "e[bacteria]-b-e",
    enabled = false,
    allow_productivity = true,
    result_is_always_fresh = true,
    energy_required = 10,
    ingredients =
    {
      {type = "fluid", name = "organic-solution", amount = 100},
      {type = "item", name = "oil-bacteria", amount = 1}
    },
    results =
    { 
      {type = "fluid", name = "crude-oil", amount = 40},
      {type = "item", name = "oil-bacteria",amount_min = 1,amount_max=2,probability=0.8}
    },
    crafting_machine_tint =oil_crafting_machine_tint
  },
  {--冶炼油细菌出沥青铀矿
    allow_productivity = true,
    category = "smelting",
    energy_required = 4,
    ingredients = {
      {
        amount = 1,
        name = "oil-bacteria",
        type = "item"
      }
    },
    name = "pitchblende",
    results = {
      {
        amount = 1,
        name = "pitchblende",
        type = "item"
      }
    },
    type = "recipe",
    enabled=false
  }
})
data.raw.recipe["uranium-processing"].ingredients={
  {type = "item", name = "pitchblende", amount = 1}
}
local advanced_metallic_asteroid_crushing=table.deepcopy(data.raw.recipe["advanced-metallic-asteroid-crushing"])
advanced_metallic_asteroid_crushing.category="crafting-with-fluid-or-metallurgy"
advanced_metallic_asteroid_crushing.results={
  {type="fluid",name="lava",amount=400}
}
data.raw.recipe["advanced-metallic-asteroid-crushing"]=advanced_metallic_asteroid_crushing
data:extend{
  {--岩浆提取钨
  type = "recipe",
  name = "molten-tungsten-from-lava",
  icon = "__spaceship-beginning__/graphics/icons/molten-tungsten-from-lava.png",
  category = "crafting-with-fluid-or-metallurgy",
  subgroup = "vulcanus-processes",
  order = "b-c",
  enabled = false,
  allow_productivity = true,
  energy_required = 10,
  ingredients =
  {
    {type = "fluid", name = "lava", amount = 500},
    {type = "item", name = "calcite", amount = 1}
  },
  results =
  {
    {amount = 15,name = "stone",type = "item"},
    {amount=10,name="tungsten-ore",type="item"}
  }
},
{--金属星岩循环出钬
  type = "recipe",
  name = "metallic-asteroid-recycling",
  icons ={
  {
    icon = "__quality__/graphics/icons/recycling.png"
  },
  {
    icon = "__space-age__/graphics/icons/metallic-asteroid-chunk.png",
    scale = 0.4
  },
  {
    icon = "__quality__/graphics/icons/recycling-top.png"
  }
  },
  category = "recycling",
  subgroup = "fulgora-processes",
  order = "a-a-b",
  enabled = false,
  allow_productivity = true,
  energy_required = 10,
  ingredients =
  {
    {type = "item", name = "metallic-asteroid-chunk", amount = 1}
  },
  results =
  {
    {amount = 12,name = "iron-ore",type = "item",probability = 0.5},
    {amount = 12,name = "copper-ore",type = "item",probability = 0.5},
    {amount = 1,name = "holmium-ore",type = "item",probability = 0.1}
  }
}
}--下调回收出种子概率，无法实现增殖（很邪恶）
data.raw.recipe["yumako-processing"].results={
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
data.raw.recipe["jellynut-processing"].results={
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
data:extend{
  {
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
    icon = "__spaceship-beginning__/graphics/icons/organic-solution-from-bioflux.png",
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

for i=1,3 do
  local aquilo_asteroid_recipe={
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
    icon = "__spaceship-beginning__/graphics/icons/aquilo-asteroid-smelting-"..i..".png",
    ingredients = {
      {
        amount = 1,
        name = "aquilo-asteroid-chunk",
        type = "item"
      },
      {
        amount=300,
        name = "water",
        type = "fluid"
      }
    },
    name = "aquilo-asteroid-smelting-"..i,
    order = "d-d",
    results = {
    },
    subgroup = "fluid-recipes",
    type = "recipe"
  }
  local aquilo_asteroid_result={
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
  aquilo_asteroid_result[i].amount=0
  aquilo_asteroid_recipe.results=aquilo_asteroid_result
  -- table.insert(aquilo_asteroid_recipe.results,aquilo_asteroid_result[i>(i)%3+1 and i or (i)%3+1])
  -- table.insert(aquilo_asteroid_recipe.results,aquilo_asteroid_result[i<(i)%3+1 and i or (i)%3+1])
  data:extend{aquilo_asteroid_recipe}
end
for _,i in pairs({"iron","copper"}) do
  data.raw.recipe[i.."-bacteria"].ingredients={
    {
      amount = 1,
      name = "oil-bacteria",
      type = "item"
    },
    {
      amount = 10,
      name = i.."-ore",
      type = "item"
    }
  }
  data.raw.recipe[i.."-bacteria"].results={
    {
      amount = 1,
      name = "oil-bacteria",
      type = "item",
      probability=0.9
    },
    {
      amount = 1,
      name = i.."-bacteria",
      type = "item",
      probability=0.1
    }
  }
  data.raw.recipe[i.."-bacteria-cultivation"].ingredients={
    {
      amount = 1,
      name = i.."-bacteria",
      type = "item"
    },
    {
      amount = 20,
      name = "organic-solution",
      type = "fluid"
    }
  }
  data.raw.recipe[i.."-bacteria-cultivation"].results={
    {
      amount_min = 1,
      amount_max = 2,
      name = i.."-bacteria",
      type = "item",
      probability=0.8
    },
    {
      amount = 2,
      name = i.."-ore",
      type = "item"
    }
  }
end
