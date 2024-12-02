local utils = require "utils"
local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")
local mothership_asteroid =
{
  probability_on_range_chunk =
  {
    {position = 0.1, probability = asteroid_util.nauvis_chunks, angle_when_stopped = asteroid_util.chunk_angle},
    {position = 0.9, probability = asteroid_util.vulcanus_chunks, angle_when_stopped = asteroid_util.chunk_angle}
  },
  type_ratios =
  {
    {position = 0.1, ratios = {5,6,7,0}},
    {position = 0.9, ratios = {9,10,11,0}},
  }
}

--挪一下母星的位置
data.raw.planet.nauvis.orientation=0.23
--冰星不能有entities_require_heating 否则不能手动绑定平面
data.raw.planet.aquilo.entities_require_heating =false
data.raw.planet.fulgora.lightning_properties=nil--似乎会导致闪退
local mothership = table.deepcopy(data.raw.planet["nauvis"])
mothership.name = "mothership"
mothership.icon = "__spaceplatform-block__/graphics/icons/mothership.png"
mothership.starmap_icon = "__spaceplatform-block__/graphics/icons/starmap-mothership.png"
mothership.starmap_icon_size=64
mothership.gravity_pull = 0
mothership.distance=5
mothership.orientation = 0.2
mothership.magnitude = 0.5
mothership.order="z"
mothership.map_gen_settings=nil
mothership.surface_properties =
{
  ["day-night-cycle"] = 0,
  ["solar-power"] = 600,
  pressure = 0,
  gravity = 0
}
mothership.solar_power_in_space=600
mothership.draw_orbit=false
data:extend{mothership}

data:extend({
    mothership,--母舰
    --母舰到各星球的航道
    {
        type = "space-connection",
        name = "mothership-vulcanus",
        subgroup = "planet-connections",
        from = "mothership",
        to = "vulcanus",
        order = "a-a",
        length = 10000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(mothership_asteroid),
        icons =
        {
          {icon = "__space-age__/graphics/icons/planet-route.png"},
          {icon = data.raw.planet.mothership.icon, icon_size = data.raw.planet.mothership.icon_size or 64, scale = 0.333 * (64 / (data.raw.planet.mothership.icon_size or 64)), shift = {-6, -6}},
          {icon = data.raw.planet.vulcanus.icon, icon_size = data.raw.planet.vulcanus.icon_size or 64, scale = 0.333 * (64 / (data.raw.planet.vulcanus.icon_size or 64)), shift = {6, 6}}
        }
    },
    {
        type = "space-connection",
        name = "mothership-nauvis",
        subgroup = "planet-connections",
        from = "mothership",
        to = "nauvisorbit",
        order = "b-a",
        length = 5000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(mothership_asteroid),
        icons =
        {
          {icon = "__space-age__/graphics/icons/planet-route.png"},
          {icon = data.raw.planet.mothership.icon, icon_size = data.raw.planet.mothership.icon_size or 64, scale = 0.333 * (64 / (data.raw.planet.mothership.icon_size or 64)), shift = {-6, -6}},
          {icon = data.raw.planet.nauvisorbit.icon, icon_size = data.raw.planet.nauvisorbit.icon_size or 64, scale = 0.333 * (64 / (data.raw.planet.nauvisorbit.icon_size or 64)), shift = {6, 6}}
        }
    },
    {
      type = "space-connection",
      name = "pluto-solar-system-edge",
      subgroup = "planet-connections",
      from = "pluto",
      to = "solar-system-edge",
      order = "b-a",
      length = 10000,
      asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.aquilo_solar_system_edge),
      icons =
      {
        {icon = "__space-age__/graphics/icons/planet-route.png"},
        {icon = data.raw.planet.pluto.icon, icon_size = data.raw.planet.pluto.icon_size or 64, scale = 0.333 * (64 / (data.raw.planet.pluto.icon_size or 64)), shift = {-6, -6}},
        {icon = data.raw["space-location"]["solar-system-edge"].icon, icon_size = data.raw["space-location"]["solar-system-edge"].icon_size or 64, scale = 0.333 * (64 / (data.raw["space-location"]["solar-system-edge"].icon_size or 64)), shift = {6, 6}}
      }
  }
})
data.raw["space-connection"]["aquilo-solar-system-edge"]=nil
--航道交给新平台
for _,connection in pairs(data.raw["space-connection"]) do
  if connection.from=="nauvis" then
    connection.from="nauvisorbit"
  end
  if connection.to=="nauvisorbit" then
    connection.to="nauvisorbit"
  end
end
data.raw["space-location"]["solar-system-edge"].distance=130
data.raw["space-location"]["solar-system-edge"].orientation = 290 / 360
data.raw["space-location"]["shattered-planet"].distance=140
data.raw["space-location"]["shattered-planet"].orientation = 290 / 360
