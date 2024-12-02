require("prototypes/planets")
local utils = require "utils"
local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")


--调整表面条件为0气压
for _,collection in pairs (data.raw) do
    for name,thing in pairs (collection) do
	    if thing.surface_conditions then thing.surface_conditions = {      {
            property = "pressure",
            min = 0,
            max = 0
          }} end
      if thing.type=="recipe"then
        thing.maximum_productivity=100
      end
    end
end
-- data:extend{
--   {
--     type = "space-connection",
--     name = "nauvis-nauvisorbit",
--     subgroup = "planet-connections",
--     from = "nauvis",
--     to = "nauvisorbit",
--     order = "a-a",
--     length = 100,
--     asteroid_spawn_definitions = asteroid_util.spawn_definitions(
--     {
--       probability_on_range_chunk =
--       {
--         {position = 0.1, probability = asteroid_util.nauvis_chunks, angle_when_stopped = asteroid_util.chunk_angle},
--         {position = 0.9, probability = asteroid_util.vulcanus_chunks, angle_when_stopped = asteroid_util.chunk_angle}
--       },
--       type_ratios =
--       {
--         {position = 0.1, ratios = {5,6,7,0}},
--         {position = 0.9, ratios = {9,10,11,0}},
--       }
--     }),
--     icons=
--     {
--       {icon = "__space-age__/graphics/icons/planet-route.png"},
--       {icon = data.raw.planet.nauvis.icon, icon_size = data.raw.planet.nauvis.icon_size or 64, scale = 0.333 * (64 / (data.raw.planet.nauvis.icon_size or 64)), shift = {-6, -6}},
--       {icon = data.raw["space-location"].nauvisorbit.icon, icon_size = data.raw["space-location"].nauvisorbit.icon_size or 64, scale = 0.333 * (64 / (data.raw["space-location"].nauvisorbit.icon_size or 64)), shift = {6, 6}}
--     }
-- }
-- }
