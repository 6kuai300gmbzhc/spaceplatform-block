require("prototypes.entity.fly-to-die-thruster")
require("prototypes.entity.reverse-thruster")
require("prototypes.entity.heat-extractor")
require("prototypes.entity.fluoroketone-heat-exchanger")
require("prototypes.entity.fluoroketone-generator")
require("prototypes.entity.asteroid-boiler")
require("prototypes.entity.arc-furnace")
--让石炉和钢炉变成耗电而不是烧燃料
data.raw.furnace["stone-furnace"].energy_source={
  emissions_per_minute = {
    pollution = 2
  },
  type = "electric",
  usage_priority = "secondary-input"
}
data.raw.furnace["steel-furnace"].energy_source={
  emissions_per_minute = {
    pollution = 4
  },
  type = "electric",
  usage_priority = "secondary-input"
}