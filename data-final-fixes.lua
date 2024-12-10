require("prototypes/planets")
local utils = require "utils"
local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")


--调整表面条件为0气压
for _,collection in pairs (data.raw) do
    for name,thing in pairs (collection) do
	    if thing.surface_conditions then 
        thing.surface_conditions = {{
            property = "pressure",
            min = 0,
            max = 1
        }} end
      if thing.type=="recipe"then
        thing.maximum_productivity=100
      end
    end
end
data.raw.thruster.thruster.surface_conditions={
  {
    max = 0,
    min = 0,
    property = "pressure"
  }
}
data.raw["rocket-silo"]["rocket-silo"].surface_conditions={
  {
    max = 1,
    min = 0,
    property = "pressure"
  },
  {
    max = 0,
    min = 0,
    property = "gravity"
  }
}
data.raw["rocket-silo"]["sol-rocket-silo"].surface_conditions={
  {
    max = 1000,
    min = 1000,
    property = "gravity"
  }
}
data.raw["space-platform-hub"]["space-platform-hub"].surface_conditions={
  {
    max = 1,
    min = 0,
    property = "pressure"
  },
  {
    max = 0,
    min = 0,
    property = "gravity"
  }
}