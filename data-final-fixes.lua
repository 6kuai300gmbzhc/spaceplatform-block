local utils = require "utils"
local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")
if settings.startup["gamemode"].value == "fly-to-die" then
  require("fly-to-die.main")
end

--调整表面条件为0气压
--调整产能上线为100
for _, collection in pairs(data.raw) do
  for name, thing in pairs(collection) do
    if thing.surface_conditions then
      thing.surface_conditions = { {
        property = "pressure",
        min = 0,
        max = 10000
      } }
    end
    if thing.type == "recipe" then
      thing.maximum_productivity = 100
    end
  end
end
data.raw.thruster.thruster.surface_conditions = {
  {
    max = 0,
    min = 0,
    property = "pressure"
  }
}
data.raw["rocket-silo"]["rocket-silo"].surface_conditions = {
  {
    max = 10000,
    min = 0,
    property = "pressure"
  },
  {
    max = 50,
    min = 0,
    property = "gravity"
  }
}
data.raw["rocket-silo"]["sol-rocket-silo"].surface_conditions = {
  {
    max = 200,
    min = 200,
    property = "gravity"
  }
}
data.raw["space-platform-hub"]["space-platform-hub"].surface_conditions = {
  {
    max = 10000,
    min = 0,
    property = "pressure"
  },
  {
    max = 50,
    min = 0,
    property = "gravity"
  }
}
