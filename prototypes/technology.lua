local utils = require("utils")
--禁用用不到的科技,建筑机器人挪到太阳之后
data.raw.technology["rail-support-foundations"].enabled=false
data.raw.technology["cliff-explosives"].enabled=false
--钢
utils.remove_packs("steel-processing", { "automation-science-pack" })
utils.set_prerequisites("steel-processing", { "space-science-pack" })
--太阳能
utils.remove_packs("solar-energy", { "logistic-science-pack" })
utils.set_count("solar-energy", 20)
utils.set_prerequisites("solar-energy", { "steel-processing", "automation-science-pack" })
--组装机
utils.remove_packs("automation", { "automation-science-pack" })
utils.set_prerequisites("automation", { "electronics" })
--锅炉
-- utils.remove_recipes("steam-power",{"boiler"})
utils.add_recipes("steam-power",{"asteroid-boiler"})
utils.add_recipes("steam-power",{"steam-from-asteroids"})
utils.remove_recipes("steam-power", { "offshore-pump" })
utils.add_recipes("fluid-handling",{"cold-steam-from-ice","water-from-ice","cold-steam-from-water","steam-heating"})
--各种调依赖
utils.set_prerequisites("space-science-pack", {})
utils.set_prerequisites("electronics", { "space-science-pack" })
utils.set_prerequisites("steam-power", { "space-science-pack" })
table.insert(data.raw.technology["space-science-pack"],
{
  modifier = true,
  type = "create-ghost-on-entity-death"
})--自动生成虚影

utils.set_prerequisites("gun-turret", { "space-science-pack" })
utils.set_unit("gun-turret", {
  count = 10,
  ingredients = {
    {
      "space-science-pack",
      1
    }
  },
  time = 10
}
)


utils.set_prerequisites("logistic-system", { "logistic-robotics" })
utils.add_recipes("steel-processing", { "space-platform-foundation" })
data.raw.technology["space-platform"].enabled = false
data.raw.technology["space-platform"].research_trigger = nil
utils.set_unit("space-platform", {
  count = 10,
  ingredients = {
    {
      "space-science-pack",
      1
    }
  },
  time = 10
})

--utils.set_prerequisites("space-platform",{"rocket-silo"})
utils.remove_recipes("space-platform",
  { "metallic-astroid-crushing", "carbonic-astroid-crushing", "oxide-astroid-crushing", "crusher" })
data.raw["technology"]["rocket-silo"]["effects"] = { {
  type = "unlock-space-location",
  space_location = "mothership",
  use_icon_overlay_constant = true
} }
utils.set_prerequisites("space-platform-thruster", { "rocket-silo" })
utils.set_prerequisites("rocket-silo", { "processing-unit", "electric-engine", "low-density-structure" })
utils.add_recipes("rocket-silo",
  { "space-platform-starter-pack", "mothership_pack", "rocket-silo", "space-platform-hub", "cargo-bay" })
utils.remove_recipes("space-platform-thruster", { "ice-melting" })

data.raw.technology.landfill.enabled = false

--化工&生物
data:extend({
  {
    type = "technology",
    name = "biomass-gathering",
    icon = "__spaceplatform-block__/graphics/icons/biomass-gathering.png",
    icon_size = 256,
    essential = true,
    effects = {},
    prerequisites = { "fluid-handling" },
    unit = {
      count = 100,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack",   1 },
        { "space-science-pack",      1 }
      },
      time = 30
    }
  },
  {
    type = "technology",
    name = "germiculture",
    icon = "__spaceplatform-block__/graphics/icons/bacteria-cultivation.png",
    icon_size = 64,
    essential = true,
    effects = {},
    prerequisites = { "biomass-gathering" },
    unit = nil,
    research_trigger = {
      type = "craft-fluid",
      fluid = "organic-solution",
      amount = 50
    }
  }
})

utils.add_recipes("biomass-gathering",
  { "ice-melting", "oil-refinery", "basic-oil-processing", "solid-fuel-from-petroleum-gas" })
data.raw.technology["oil-processing"].enabled = false
data.raw.technology["oil-gathering"].enabled = false

utils.add_recipes("biomass-gathering", { "organic-solution-gathering", "chemical-plant" })
utils.add_recipes("germiculture",
  { "bacteria-discovering", "bacteria-cultivation", "extracting-organic-solution-from-bacteria",
    "carbon-astroid-natural-selecting", "oil-bacteria-evolution", "oil-bacteria-cultivation" })

utils.set_prerequisites("plastics", { "germiculture" })
utils.add_recipes("plastics", { "plastic-bacteria-cultivation" })
utils.set_prerequisites("sulfur-processing", { "germiculture" })
utils.add_recipes("sulfur-processing", { "sulfur-bacteria-cultivation", "coal-synthesis", "sulfuric-acid-from-bacteria" })

utils.set_prerequisites("flammables", { "biomass-gathering" })

--母星科技
data:extend { {
  type = "technology",
  name = "planet-discovery-nauvis",
  icons = util.technology_icon_constant_planet("__spaceplatform-block__/nauvis.png"),
  icon_size = 256,
  essential = true,
  effects = {},
  prerequisites = { "space-platform-thruster" },
  unit = {
    count = 1000,
    ingredients = {
      { "automation-science-pack", 1 },
      { "logistic-science-pack",   1 },
      { "chemical-science-pack",   1 },
      { "space-science-pack",      1 }
    },
    time = 60
  }
} }
utils.set_prerequisites("uranium-mining", { "planet-discovery-nauvis" })
utils.add_prerequisites("captivity", { "planet-discovery-nauvis" })
utils.add_prerequisites("fish-breeding", { "planet-discovery-nauvis" })
utils.add_prerequisites("tree-seeding", { "planet-discovery-nauvis" })
utils.add_prerequisites("planet-discovery-aquilo", { "planet-discovery-nauvis" })
utils.add_recipes("uranium-mining", { "uranium-asteroid-crushing" })
utils.set_trigger("uranium-processing", { type = "craft-item", item = "uranium-ore", count = 50 })
utils.set_count("steel-processing", 20)
utils.set_count("logistic-science-pack", 50)
utils.add_recipes("engine", { "asteroid-collector" })
utils.remove_recipes("space-platform", { "asteroid-collector" })
utils.add_recipes("low-density-structure",
  { "crusher", "metallic-asteroid-crushing", "carbonic-asteroid-crushing", "oxide-asteroid-crushing" })
utils.add_recipes("electric-engine",
  { "crusher", "metallic-asteroid-crushing", "carbonic-asteroid-crushing", "oxide-asteroid-crushing" })
--火星科技
utils.set_trigger("calcite-processing", { type = "craft-item", item = "calcite", count = 5 })
utils.set_prerequisites("tungsten-steel", { "foundry" })
utils.set_trigger("tungsten-steel", { type = "craft-item", item = "foundry", amount = 1 })
utils.set_trigger("tungsten-carbide", { type = "craft-item", item = "tungsten-ore", count = 5 })
data.raw.technology["big-mining-drill"].enabled = false
data.raw.technology["electric-mining-drill"].enabled = false
utils.add_recipes("planet-discovery-vulcanus",
  { "advanced-oxide-asteroid-crushing", "advanced-metallic-asteroid-crushing", "tungsten-from-lava" })

--草星科技
data.raw.technology["overgrowth-soil"].enabled = false
data.raw.technology["artificial-soil"].enabled = false
utils.set_prerequisites("planet-discovery-gleba", { "space-platform-thruster" })
utils.set_prerequisites("agricultural-science-pack", { "bioflux-processing", "bacteria-cultivation" })
utils.remove_recipes("rocket-turret", { "coal-synthesis" })
utils.add_recipes("planet-discovery-gleba", { "organic-asteroid-crushing" })
utils.set_trigger("agriculture", { type = "craft-item", item = "spoilage", count = 20 })
utils.set_trigger("jellynut", { type = "craft-item", item = "jellynut-seed", count = 1 })
utils.set_trigger("yumako", { type = "craft-item", item = "yumako-seed", count = 1 })
utils.set_trigger("heating-tower", { type = "craft-item", item = "pentapod-egg", count = 1 })
utils.add_recipes("bioflux", { "organic-solution-from-bioflux" })
data:extend {
  {
    type = "technology",
    name = "space-plant",
    localised_description = { "description.space-plant" },
    icon = "__space-age__/graphics/technology/overgrowth-soil.png",
    icon_size = 256,
    essential = true,
    effects = {},
    prerequisites = { "agricultural-science-pack" },
    unit = {
      count = 1000,
      ingredients = {
        { "automation-science-pack",   1 },
        { "logistic-science-pack",     1 },
        { "chemical-science-pack",     1 },
        { "space-science-pack",        1 },
        { "agricultural-science-pack", 1 },
        { "production-science-pack",   1 },
        { "utility-science-pack",      1 }
      },
      time = 60
    }
  }
}
utils.add_recipes("space-plant", { "cuttlepop-seed", "hairyclubnub-seed" })
data.raw.technology["plastic-bar-productivity"].effects = {
  {
    type = "change-recipe-productivity",
    recipe = "plastic-bar",
    change = 0.1
  },
  {
    type = "change-recipe-productivity",
    recipe = "bioplastic",
    change = 0.1
  },
  {
    type = "change-recipe-productivity",
    recipe = "plastic-bacteria-cultivation",
    change = 0.1
  }
}
--雷星科技
utils.set_prerequisites("holmium-processing", { "planet-discovery-fulgora" })
utils.set_trigger("holmium-processing", { type = "craft-fluid", fluid = "holmium-solution", count = 100 })
utils.remove_recipes("holmium-processing", { "holmium-solution" })
utils.add_recipes("planet-discovery-fulgora", { "holmium-solution" })
utils.set_prerequisites("recycling", { "processing-unit", "concrete", "production-science-pack" })
utils.remove_recipes("planet-discovery-fulgora", { "lightning-rod" })
data.raw.technology["lightning-collector"].enabled = false
data.raw.technology.recycling.research_trigger = nil
data.raw.technology.recycling.unit =
{
  count = 200,
  ingredients =
  {
    { "automation-science-pack", 1 },
    { "logistic-science-pack",   1 },
    { "chemical-science-pack",   1 },
    { "production-science-pack", 1 }
  },
  time = 15
}
data.raw.technology["scrap-recycling-productivity"] = nil
data.raw.technology["rail-support-foundations"].enabled = false
utils.remove_recipes("recycling", { "scrap-recycling" })
--冰星科技
utils.set_trigger("lithium-processing", { type = "craft-fluid", fluid = "lithium-brine", count = 200 })
utils.add_recipes("planet-discovery-aquilo",
  { "aquilo-asteroid-smelting-1", "aquilo-asteroid-smelting-2", "aquilo-asteroid-smelting-3" })
utils.add_recipes("quantum-processor", { "sol-rocket-silo" })
utils.set_prerequisites("quantum-processor", { "cryogenic-science-pack" })
--区段产能科技
local rocket_final = table.deepcopy(data.raw.technology["rocket-part-productivity"])
data.raw.technology["rocket-part-productivity"] = nil
rocket_final.unit.count_formula = "1.2^(L+30)*2"
rocket_final.prerequisites = { "rocket-part-productivity-stage2" }
rocket_final.name = "rocket-part-productivity-stage3"
local rocket_2 = table.deepcopy(rocket_final)
rocket_2.max_level = 15
rocket_2.unit.count_formula = "1.2^(L+15)*2"
rocket_2.unit.ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 }, { "production-science-pack", 1 } }
rocket_2.prerequisites = { "rocket-part-productivity-stage1" }
rocket_2.name = "rocket-part-productivity-stage2"
local rocket_1 = table.deepcopy(rocket_2)
rocket_1.name = "rocket-part-productivity-stage1"
rocket_1.unit.count_formula = "1.2^L*2"
rocket_1.unit.ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 } }
rocket_1.max_level = 15
rocket_1.prerequisites = { "rocket-silo" }
data.extend { rocket_1, rocket_2, rocket_final }

--废料科技，指向物质合成
data:extend { {
  type = "technology",
  name = "scrap-recycling",
  icon = "__core__/graphics/icons/starmap-star.png",
  icon_size = 384,
  essential = false,
  effects = {},
  prerequisites = { "quantum-processor" },
  research_trigger = { type = "mine-entity", entity = "fulgoran-ruin-attractor" }
} }
--建筑机器人在太阳之后，只有太阳可以用建筑机器人
utils.set_prerequisites("construction-robotics",{"robotics","scrap-recycling"})
data.raw.technology["construction-robotics"].effects={--去掉虚影
  {
    recipe = "roboport",
    type = "unlock-recipe"
  },
  {
    recipe = "passive-provider-chest",
    type = "unlock-recipe"
  },
  {
    recipe = "storage-chest",
    type = "unlock-recipe"
  },
  {
    recipe = "construction-robot",
    type = "unlock-recipe"
  }
}


utils.add_recipes("scrap-recycling", { "scrap-recycling" })
for _, planet in pairs(data.raw.planet) do --关闭科技发现星球
  if data.raw.technology["planet-discovery-" .. planet.name] then
    utils.remove_space_location_to_technology("planet-discovery-" .. planet.name, planet.name)
  end
end



--自动重炮
data:extend {
  {
    type = "technology",
    name = "automated-artillery-turret",
    icon = "__spaceplatform-block__/graphics/icons/automated-artillery-turret-technology.png",
    icon_size = 256,
    essential = false,
    prerequisites = { "quantum-processor","artillery" },
    unit ={
      count = 2000,
      ingredients =
      {
        {"automation-science-pack",1},
        {"logistic-science-pack",1},
        {"chemical-science-pack",1},
        {"military-science-pack",1},
        {"production-science-pack",1},
        {"utility-science-pack",1},
        {"space-science-pack",1},
        {"metallurgic-science-pack",1},
        {"electromagnetic-science-pack",1},
        {"agricultural-science-pack",1},
        {"cryogenic-science-pack",1}
      },
      time = 60
    },
    effects={
      {
        recipe="automated-artillery-turret",
        type = "unlock-recipe"
      }
    }
  }
}


--关闭真实太阳系的各种科技
local DLCplanets = { "nauvis", "vulcanus", "gleba", "aquilo", "fulgora" }
for name, planet in pairs(data.raw.planet) do
  local isDLC = false
  for _, DLCname in pairs(DLCplanets) do
    if name == DLCname then
      isDLC = true
      break
    end
  end
  if not isDLC then
    if data.raw.technology["planet-discovery-" .. name] then
      data.raw.technology["planet-discovery-" .. name].enabled = false
      data.raw.technology["planet-discovery-" .. name].essential = false
    end
  end
end

--加白瓶
for _, technology in pairs(data.raw.technology) do
  if technology.unit then
    utils.add_pack(technology.name, "space-science-pack")
  end
end
