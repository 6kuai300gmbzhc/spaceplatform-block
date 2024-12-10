local utils = require("utils")
--钢
utils.remove_packs("steel-processing",{"automation-science-pack"})
utils.set_prerequisites("steel-processing",{"space-science-pack"})
--太阳能
utils.remove_packs("solar-energy",{"logistic-science-pack"})
utils.set_count("solar-energy",50)
utils.set_prerequisites("solar-energy",{"steel-processing","automation-science-pack"})
--组装机
utils.remove_packs("automation",{"automation-science-pack"})
utils.set_prerequisites("automation",{"electronics"})


--各种调依赖
utils.set_prerequisites("space-science-pack", {})
utils.set_prerequisites("electronics", {"space-science-pack"})
utils.set_prerequisites("steam-power", {"space-science-pack"})
utils.remove_recipes("steam-power",{"offshore-pump"})
utils.set_prerequisites("logistic-system", {"logistic-robotics"})
utils.add_recipes("steel-processing",{"space-platform-foundation"})
data.raw.technology["space-platform"].enabled=false
--utils.set_prerequisites("space-platform",{"rocket-silo"})
utils.remove_recipes("space-platform",{"metallic-astroid-crushing","carbonic-astroid-crushing","oxide-astroid-crushing","crusher"})
data.raw["technology"]["rocket-silo"]["effects"]={{
    type = "unlock-space-location",
    space_location = "mothership",
    use_icon_overlay_constant = true
}}
utils.set_prerequisites("space-platform-thruster",{"rocket-silo"})
utils.set_prerequisites("rocket-silo",{"processing-unit","electric-engine","low-density-structure"})
utils.add_recipes("rocket-silo",{"space-platform-starter-pack","mothership_pack","rocket-silo","space-platform-hub","cargo-bay"})
utils.remove_recipes("space-platform-thruster",{"ice-melting"})
data.raw.technology.landfill.enabled=false

--化工&生物
data:extend({
    {
    type = "technology",
    name = "biomass-gathering",
    icon = "__spaceplatform-block__/graphics/icons/biomass-gathering.png",
    icon_size = 256,
    essential = true,
    effects = {},
    prerequisites = {"fluid-handling"},
    unit = {
        count = 100,
        ingredients = {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"space-science-pack", 1}
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
    prerequisites = {"biomass-gathering"},
    unit = nil,
    research_trigger={
        type="craft-fluid",
        fluid="organic-solution",
        amount=50
    }
    }
})

utils.add_recipes("biomass-gathering",{"ice-melting","oil-refinery","basic-oil-processing","solid-fuel-from-petroleum-gas"})
data.raw.technology["oil-processing"].enabled=false
data.raw.technology["oil-gathering"].enabled=false

utils.add_recipes("biomass-gathering",{"organic-solution-gathering","chemical-plant"})
utils.add_recipes("germiculture",{"bacteria-discovering","bacteria-cultivation","extracting-organic-solution-from-bacteria","carbon-astroid-natural-selecting","oil-bacteria-evolution","oil-bacteria-cultivation"})

utils.set_prerequisites("plastics",{"germiculture"})
utils.add_recipes("plastics",{"plastic-bacteria-cultivation"})
utils.set_prerequisites("sulfur-processing",{"germiculture"})
utils.add_recipes("sulfur-processing",{"sulfur-bacteria-cultivation","coal-synthesis"})

utils.set_prerequisites("flammables",{"biomass-gathering"})

--母星科技
data:extend{{
    type = "technology",
    name = "planet-discovery-nauvis",
    icons = util.technology_icon_constant_planet("__spaceplatform-block__/nauvis.png"),
    icon_size = 256,
    essential = true,
    effects = {},
    prerequisites = {"space-platform-thruster"},
    unit = {
        count = 1000,
        ingredients = {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
            {"space-science-pack", 1}
        },
        time = 60
    }
}}
utils.set_prerequisites("uranium-mining", {"planet-discovery-nauvis"})
utils.add_prerequisites("captivity", {"planet-discovery-nauvis"})
utils.add_prerequisites("fish-breeding", {"planet-discovery-nauvis"})
utils.add_prerequisites("tree-seeding", {"planet-discovery-nauvis"})
utils.add_prerequisites("planet-discovery-aquilo", {"planet-discovery-nauvis"})
utils.add_recipes("uranium-mining", {"uranium-asteroid-crushing"})
utils.set_trigger("uranium-processing", {type = "craft-item", item = "uranium-ore",count=50})
utils.set_count("steel-processing",20)
utils.set_count("logistic-science-pack",50)
utils.add_recipes("engine",{"asteroid-collector"})
utils.remove_recipes("space-platform",{"asteroid-collector"})
utils.add_recipes("low-density-structure",{"crusher","metallic-asteroid-crushing","carbonic-asteroid-crushing","oxide-asteroid-crushing"})
utils.add_recipes("electric-engine",{"crusher","metallic-asteroid-crushing","carbonic-asteroid-crushing","oxide-asteroid-crushing"})
--火星科技
utils.set_trigger("calcite-processing", {type = "craft-item", item = "calcite",count=5})
utils.set_prerequisites("tungsten-steel",{"foundry"})
utils.set_trigger("tungsten-steel",{type="craft-item",item="foundry",amount=1})
utils.set_trigger("tungsten-carbide",{type = "craft-item", item = "tungsten-ore",count=5})
data.raw.technology["big-mining-drill"].enabled=false
data.raw.technology["electric-mining-drill"].enabled=false
utils.add_recipes("planet-discovery-vulcanus",{"advanced-oxide-asteroid-crushing","advanced-metallic-asteroid-crushing","tungsten-from-lava"})

--草星科技
data.raw.technology["overgrowth-soil"].enabled=false
data.raw.technology["artificial-soil"].enabled=false
utils.set_prerequisites("planet-discovery-gleba",{"space-platform-thruster"})
utils.set_prerequisites("agricultural-science-pack",{"bioflux-processing", "bacteria-cultivation"})
utils.remove_recipes("rocket-turret",{"coal-synthesis"})
utils.add_recipes("planet-discovery-gleba",{"organic-asteroid-crushing"})
utils.set_trigger("agriculture",{type = "craft-item", item = "spoilage",count=20})
utils.set_trigger("jellynut",{type = "craft-item", item = "jellynut-seed",count=1})
utils.set_trigger("yumako",{type = "craft-item", item = "yumako-seed",count=1})
utils.set_trigger("heating-tower",{type = "craft-item", item = "pentapod-egg",count=1})
utils.add_recipes("bioflux",{"organic-solution-from-bioflux"})
data:extend{
    {
        type = "technology",
        name = "space-plant",
        localised_description={"description.space-plant"},
        icon = "__space-age__/graphics/technology/overgrowth-soil.png",
        icon_size = 256,
        essential = true,
        effects = {},
        prerequisites = {"agricultural-science-pack"},
        unit = {
            count = 1000,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"space-science-pack", 1},
                {"agricultural-science-pack",1},
                {"production-science-pack",1},
                {"utility-science-pack",1}
            },
            time = 60
        }
    }
}
utils.add_recipes("space-plant",{"cuttlepop-seed","hairyclubnub-seed"})
data.raw.technology["plastic-bar-productivity"].effects={
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
utils.set_prerequisites("holmium-processing",{"planet-discovery-fulgora"})
utils.set_trigger("holmium-processing",{type = "craft-fluid", fluid = "holmium-solution",count=100})
utils.remove_recipes("holmium-processing",{"holmium-solution"})
utils.add_recipes("planet-discovery-fulgora",{"holmium-solution"})
utils.set_prerequisites("recycling",{"processing-unit","concrete"})
utils.remove_recipes("planet-discovery-fulgora",{"lightning-rod"})
data.raw.technology["lightning-collector"].enabled=false
data.raw.technology.recycling.research_trigger=nil
data.raw.technology.recycling.unit =
{
  count = 200,
  ingredients =
  {
    { "automation-science-pack", 1 },
    { "logistic-science-pack", 1 },
    { "chemical-science-pack", 1 },
    { "production-science-pack", 1 }
  },
  time = 15
}
data.raw.technology["scrap-recycling-productivity"]=nil
utils.remove_recipes("recycling",{"scrap-recycling"})
--冰星科技
utils.add_recipes("planet-discovery-aquilo",{"aquilo-asteroid-smelting-1","aquilo-asteroid-smelting-2","aquilo-asteroid-smelting-3"})
utils.add_recipes("quantum-processor",{"sol-rocket-silo"})
--区段产能科技
local rocket_final = table.deepcopy(data.raw.technology["rocket-part-productivity"])
data.raw.technology["rocket-part-productivity"]=nil
rocket_final.unit.count_formula = "1.2^(L+30)*2"
rocket_final.prerequisites = {"rocket-part-productivity-stage2"}
rocket_final.name="rocket-part-productivity-stage3"
local rocket_2 = table.deepcopy(rocket_final)
rocket_2.max_level=15
rocket_2.unit.count_formula = "1.2^(L+15)*2"
rocket_2.unit.ingredients={{"automation-science-pack",1},{"logistic-science-pack",1},{"chemical-science-pack",1},{"production-science-pack",1}}
rocket_2.prerequisites = {"rocket-part-productivity-stage1"}
rocket_2.name="rocket-part-productivity-stage2"
local rocket_1 = table.deepcopy(rocket_2)
rocket_1.name="rocket-part-productivity-stage1"
rocket_1.unit.count_formula = "1.2^L*2"
rocket_1.unit.ingredients={{"automation-science-pack",1},{"logistic-science-pack",1},{"chemical-science-pack",1}}
rocket_1.max_level=15
rocket_1.prerequisites={"rocket-silo"}
data.extend{rocket_1,rocket_2,rocket_final}

--废料科技，指向物质合成
data:extend{{
    type = "technology",
    name = "scrap-recycling",
    icon = "__spaceplatform-block__/graphics/icons/scrap-recycling.png",
    icon_size = 384,
    essential = false,
    effects = {},
    prerequisites = {"space-platform-thruster"},
    research_trigger={type = "mine-entity", entity="fulgoran-ruin-attractor"}
}}
utils.add_recipes("scrap-recycling",{"scrap-recycling"})
for _,planet in pairs(data.raw.planet)do--关闭科技发现星球
    if data.raw.technology["planet-discovery-"..planet.name]then
      utils.remove_space_location_to_technology("planet-discovery-"..planet.name,planet.name)
    end
end
--关闭真实太阳系的各种科技
if mods["real-starry-universe"]then
    local PlanetTechnologies = {
    { "sol", "太阳", { "planet-discovery-sol", "space-platform-thruster" }, false },
    { "mercury", "水星", { "planet-discovery-venus", "space-platform-thruster" }, false },
    { "venus", "金星", { "planet-discovery-luna", "space-platform-thruster" }, false },
    { "earth", "地球", { "space-platform-thruster" }, false },
    { "luna", "月球", { "planet-discovery-earth", "space-platform-thruster" }, false },
    { "mars", "火星", { "planet-discovery-luna", "space-platform-thruster" }, false },
    { "phobos", "火卫一", { "planet-discovery-mars", "space-platform-thruster" }, true },
    { "deimos", "火卫二", { "planet-discovery-mars", "space-platform-thruster" }, true },
    { "asteroid-belt-inner", "内小行星带", { "planet-discovery-mars", "space-platform-thruster" }, false },
    { "jupiter", "木星", { "planet-discovery-asteroid-belt-inner", "space-platform-thruster" }, false },
    { "saturn", "土星", { "planet-discovery-jupiter", "space-platform-thruster" }, false },
    { "uranus", "天王星", { "planet-discovery-saturn", "space-platform-thruster" }, false },
    { "neptune", "海王星", { "planet-discovery-uranus", "space-platform-thruster" }, false },
    { "pluto", "冥王星", { "planet-discovery-neptune", "space-platform-thruster" }, false }
    }
    for i, tech in ipairs(PlanetTechnologies) do
        local planet_name = tech[1]
        data.raw.technology["planet-discovery-" .. planet_name].enabled=false
    end
end

--加白瓶
for _, technology in pairs(data.raw.technology) do
    if technology.unit then
        utils.add_pack(technology.name,"space-science-pack")
    end
end