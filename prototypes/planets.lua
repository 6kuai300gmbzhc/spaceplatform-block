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
for _,planet in pairs(data.raw.planet)do
  if data.raw.technology["planet-discovery-"..planet.name]then
    utils.remove_space_location_to_technology("planet-discovery-"..planet.name,planet.name)
  end
  planet.distance=planet.distance*0.75
end
--挪一下母星的位置
data.raw.planet.nauvis.orientation=0.23
data.raw.planet.fulgora.orientation=0.275
--冰星不能有entities_require_heating 否则不能手动绑定平面
data.raw.planet.aquilo.entities_require_heating =false
local mothership = table.deepcopy(data.raw.planet["nauvis"])
mothership.name = "mothership"
mothership.icon = "__spaceship-beginning__/graphics/icons/mothership.png"
mothership.starmap_icon = "__spaceship-beginning__/graphics/icons/starmap-mothership.png"
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
local nauvisorbit=table.deepcopy(data.raw.planet.nauvis)
nauvisorbit.magnitude=0.5
nauvisorbit.name="nauvisorbit"
nauvisorbit.orientation=0.25
data:extend{mothership,nauvisorbit}

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

local planet_data= require("planets_data")
--添加新的星球，自定义大陆
for _,new_planet in pairs(planet_data["new_planets"]) do
  local pattern=table.deepcopy(mothership)
  for contribute,value in pairs(new_planet) do
    pattern[contribute]=value
  end
  pattern.icon="__spaceship-beginning__/graphics/icons/space-platform-foundation.png"
  pattern.starmap_icon=pattern.icon
  data:extend{pattern}
end
for _,connection in pairs(planet_data["connetcions"]) do
  local pattern={
    type = "space-connection",
    subgroup = "planet-connections",
    order = "z-z-z",
    icons ={},
    from ="",
    to = "",
    length = 0,
    name=""
  }
  for contribute,value in pairs(connection) do
    pattern[contribute]=value
  end
  local from =data.raw.planet[pattern["from"]]
  local to = data.raw.planet[pattern["to"]]
  if  type(to)=="nil" then to = data.raw["space-location"][pattern["to"]] end
  pattern.icons= {
    {icon = "__space-age__/graphics/icons/planet-route.png"},
    {icon = from.icon, icon_size = from.icon_size or 64, scale = 0.333 * (64 / (from.icon_size or 64)), shift = {-6, -6}},
    {icon = to.icon, icon_size = to.icon_size or 64, scale = 0.333 * (64 / (to.icon_size or 64)), shift = {6, 6}}
  }
  pattern.name=pattern["from"].."-"..pattern["to"]
  data:extend{pattern}
end

