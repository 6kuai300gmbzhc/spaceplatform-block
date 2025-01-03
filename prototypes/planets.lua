--机器人能耗乘数是重力除以气压再乘以100
local utils = require "utils"

local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")
--新建一个星球代替母星
local nauvisorbit = table.deepcopy(data.raw.planet.nauvis)
nauvisorbit.name = "nauvisorbit"
data.extend { nauvisorbit }
--挪一下母星的位置藏起来
data.raw.planet.nauvis.icon_size=1
data.raw.planet.nauvis.distance=1000
data.raw.planet.nauvis.draw_orbit=false
data.raw.planet.nauvis.hidden=true
data.raw.planet.nauvis.hidden_in_factoriopedia=true
data.raw.planet.nauvis.map_gen_settings=nil
local mothership_asteroid =
{
  probability_on_range_chunk =
  {
    { position = 0.1, probability = asteroid_util.nauvis_chunks,   angle_when_stopped = asteroid_util.chunk_angle },
    { position = 0.9, probability = asteroid_util.vulcanus_chunks, angle_when_stopped = asteroid_util.chunk_angle }
  },
  type_ratios =
  {
    { position = 0.1, ratios = { 5, 6, 7, 0 } },
    { position = 0.9, ratios = { 9, 10, 11, 0 } },
  }
}
--冰星不能有entities_require_heating 否则不能手动绑定平面
data.raw.planet.aquilo.entities_require_heating = false
data.raw.planet.fulgora.lightning_properties = nil --似乎会导致闪退
local mothership = table.deepcopy(data.raw.planet["nauvis"])
mothership.name = "mothership"
mothership.icon = "__spaceplatform-block__/graphics/icons/mothership.png"
mothership.starmap_icon = "__spaceplatform-block__/graphics/icons/starmap-mothership.png"
mothership.starmap_icon_size = 64
mothership.gravity_pull = 0
mothership.distance = 5
mothership.orientation = 0.2
mothership.magnitude = 0.5
mothership.order = "z"
mothership.map_gen_settings = nil
mothership.surface_properties =
{
  ["day-night-cycle"] = 0,
  ["solar-power"] = 600,
  pressure = 0,
  gravity = 0
}
mothership.solar_power_in_space = 600
mothership.draw_orbit = false

data:extend({
  mothership --母舰
  -- { --母舰到各星球的航道
  --     type = "space-connection",
  --     name = "mothership-nauvis",
  --     subgroup = "planet-connections",
  --     from = "mothership",
  --     to = "nauvisorbit",
  --     order = "b-a",
  --     length = 5000,
  --     asteroid_spawn_definitions = asteroid_util.spawn_definitions(mothership_asteroid),
  --     icons =
  --     {
  --       {icon = "__space-age__/graphics/icons/planet-route.png"},
  --       {icon = data.raw.planet.mothership.icon, icon_size = data.raw.planet.mothership.icon_size or 64, scale = 0.333 * (64 / (data.raw.planet.mothership.icon_size or 64)), shift = {-6, -6}},
  --       {icon = data.raw.planet.nauvisorbit.icon, icon_size = data.raw.planet.nauvisorbit.icon_size or 64, scale = 0.333 * (64 / (data.raw.planet.nauvisorbit.icon_size or 64)), shift = {6, 6}}
  --     }
  -- }
})
if mods["real-starry-universe"] then
  data:extend {
    {
      type = "space-connection",
      name = "pluto-solar-system-edge",
      subgroup = "planet-connections",
      from = "pluto",
      to = "solar-system-edge",
      order = "b-a",
      length = 10000,
      asteroid_spawn_definitions = data.raw.planet["nauvis"].asteroid_spawn_definitions,
      icons =
      {
        { icon = "__space-age__/graphics/icons/planet-route.png" },
        { icon = data.raw.planet.pluto.icon,                           icon_size = data.raw.planet.pluto.icon_size or 64,                           scale = 0.333 * (64 / (data.raw.planet.pluto.icon_size or 64)),                           shift = { -6, -6 } },
        { icon = data.raw["space-location"]["solar-system-edge"].icon, icon_size = data.raw["space-location"]["solar-system-edge"].icon_size or 64, scale = 0.333 * (64 / (data.raw["space-location"]["solar-system-edge"].icon_size or 64)), shift = { 6, 6 } }
      }
    }
  }
  data.raw["space-location"]["solar-system-edge"].distance = 130
  data.raw["space-location"]["solar-system-edge"].orientation = 290 / 360
  data.raw["space-location"]["shattered-planet"].distance = 140
  data.raw["space-location"]["shattered-planet"].orientation = 290 / 360
  data.raw["space-connection"]["aquilo-solar-system-edge"] = nil
  data.raw["space-location"].sol = nil
  data.raw["space-connection"]["sol-mercury"] = nil
end
local sol = table.deepcopy(data.raw.planet.vulcanus)
sol.name = "sol"
sol.icon = "__core__/graphics/icons/starmap-star.png"
sol.icon_size = 512
sol.gravity_pull = 21.7
sol.distance = 0
sol.orientation = 0 / 360
sol.asteroid_spawn_definitions = table.deepcopy(mothership.asteroid_spawn_definitions)
sol.starmap_icon = "__core__/graphics/icons/starmap-star.png"
sol.starmap_icon_size = 512
sol.magnitude = 5
sol.map_gen_settings = {
  autoplace_settings = {
    tile = {
      settings = {
        lava = {},
        ["lava-hot"] = {}
      }
    }
  }
}
sol.player_effects = {
  action_delivery = {
    source_effects = {
      effect_id = "sol-fire-sticker",
      type = "script"
    },
    type = "instant"
  },
  type = "direct"
}
sol.ticks_between_player_effects = 1800
sol.always_day = true
sol.surface_properties = {
  ["day-night-cycle"] = 0,
  ["solar-power"] = 2000,
  pressure = 10000,
  gravity = 200,
  ["magnetic-field"] = 0
}
data:extend {
  sol
}
data:extend {
  { --太阳出去的航道
    type = "space-connection",
    name = "sol-vulcanus",
    subgroup = "planet-connections",
    from = "sol",
    to = "vulcanus",
    order = "a-a",
    length = 10000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(mothership_asteroid),
    icons =
    {
      { icon = "__space-age__/graphics/icons/planet-route.png" },
      { icon = data.raw.planet.sol.icon,                       icon_size = data.raw.planet.sol.icon_size or 64,      scale = 0.333 * (64 / (data.raw.planet.sol.icon_size or 64)),      shift = { -6, -6 } },
      { icon = data.raw.planet.vulcanus.icon,                  icon_size = data.raw.planet.vulcanus.icon_size or 64, scale = 0.333 * (64 / (data.raw.planet.vulcanus.icon_size or 64)), shift = { 6, 6 } }
    }
  }
}
--航道交给新平台
for _, connection in pairs(data.raw["space-connection"]) do
  if connection.from == "nauvis" then
    connection.from = "nauvisorbit"
  end
  if connection.to == "nauvisorbit" then
    connection.to = "nauvisorbit"
  end
end

for name, planet in pairs(data.raw.planet) do
  utils.add_asteroid_to_planet_or_location(name, "metallic", "chunk", 0.0375)
  utils.add_asteroid_to_planet_or_location(name, "carbonic", "chunk", 0.025)
  utils.add_asteroid_to_planet_or_location(name, "oxide", "chunk", 0.013)
end
--添加星岩
utils.add_asteroid_to_planet_or_location("gleba", "organic", "chunk", 0.02)
utils.add_asteroid_to_planet_or_location("vulcanus", "tungsten", "chunk", 0.02)
utils.add_asteroid_to_planet_or_location("nauvisorbit", "uranium", "chunk", 0.02)
utils.add_asteroid_to_planet_or_location("vulcanus", "holmium", "chunk", 0.02)

utils.add_asteroid_to_connection("nauvis-gleba", "organic", "chunk", 0, 0.1)
utils.add_asteroid_to_connection("nauvis-gleba", "organic", "chunk", 0.04, 0.8)

utils.add_asteroid_to_connection("vulcanus-gleba", "organic", "chunk", 0.02, 0.5)
utils.add_asteroid_to_connection("vulcanus-gleba", "organic", "chunk", 0.04, 0.8)

utils.add_asteroid_to_connection("gleba-fulgora", "organic", "chunk", 0.04, 0.2)
utils.add_asteroid_to_connection("gleba-fulgora", "organic", "chunk", 0, 0.6)

utils.add_asteroid_to_connection("gleba-aquilo", "organic", "chunk", 0.04, 0.2)
utils.add_asteroid_to_connection("gleba-aquilo", "organic", "chunk", 0, 0.6)

--添加陨石，加大坐牢力度
if settings.startup["gamemode"].value ~= "normal" then
  local metal = settings.startup["hardcore-metallic-asteroid"].value
  local carbon = settings.startup["hardcore-carbonic-asteroid"].value
  local oxide = settings.startup["hardcore-oxide-asteroid"].value

  local sol_rate = settings.startup["hardcore-sol-rate"].value
  local vulcanus_rate = settings.startup["hardcore-vulcanus-rate"].value
  local nauvisorbit_rate = settings.startup["hardcore-nauvisorbit-rate"].value
  local gleba_rate = settings.startup["hardcore-gleba-rate"].value
  local fulgora_rate = settings.startup["hardcore-fulgora-rate"].value
  local aquilo_rate = settings.startup["hardcore-aquilo-rate"].value
  local edge_rate = settings.startup["hardcore-solar-system-edge-rate"].value
  utils.add_asteroid_to_planet_or_location("sol", "metallic", "medium", metal * sol_rate)
  utils.add_asteroid_to_planet_or_location("sol", "oxide", "medium", oxide * sol_rate)
  utils.add_asteroid_to_planet_or_location("sol", "carbonic", "medium", carbon * sol_rate)

  utils.add_asteroid_to_planet_or_location("mothership", "metallic", "medium", metal * sol_rate)
  utils.add_asteroid_to_planet_or_location("mothership", "oxide", "medium", oxide * sol_rate)
  utils.add_asteroid_to_planet_or_location("mothership", "carbonic", "medium", carbon * sol_rate)

  utils.add_asteroid_to_planet_or_location("vulcanus", "metallic", "medium", metal * 5 / 4 * vulcanus_rate)
  utils.add_asteroid_to_planet_or_location("vulcanus", "oxide", "medium", oxide * 3 / 2 * vulcanus_rate)
  utils.add_asteroid_to_planet_or_location("vulcanus", "carbonic", "medium", carbon * 4 / 3 * vulcanus_rate)

  utils.add_asteroid_to_planet_or_location("nauvisorbit", "metallic", "medium", metal * 2 * nauvisorbit_rate)
  utils.add_asteroid_to_planet_or_location("nauvisorbit", "oxide", "medium", oxide * 2 * nauvisorbit_rate)
  utils.add_asteroid_to_planet_or_location("nauvisorbit", "carbonic", "medium", metal * 2 * nauvisorbit_rate)

  utils.add_asteroid_to_planet_or_location("gleba", "metallic", "big", metal * gleba_rate)
  utils.add_asteroid_to_planet_or_location("gleba", "oxide", "big", oxide * 4 * gleba_rate)
  utils.add_asteroid_to_planet_or_location("gleba", "carbonic", "big", carbon * gleba_rate)

  utils.add_asteroid_to_planet_or_location("fulgora", "metallic", "big", metal * 4 / 3 * fulgora_rate)
  utils.add_asteroid_to_planet_or_location("fulgora", "oxide", "big", oxide * 5 * fulgora_rate)
  utils.add_asteroid_to_planet_or_location("fulgora", "carbonic", "big", carbon * 4 / 3 * fulgora_rate)

  utils.add_asteroid_to_planet_or_location("aquilo", "metallic", "huge", metal / 2 * aquilo_rate)
  utils.add_asteroid_to_planet_or_location("aquilo", "oxide", "huge", oxide * 2 * aquilo_rate)
  utils.add_asteroid_to_planet_or_location("aquilo", "carbonic", "huge", carbon * 2 / 3 * aquilo_rate)

  utils.add_asteroid_to_planet_or_location("solar-system-edge", "metallic", "huge", metal * 4 / 5 * edge_rate)
  utils.add_asteroid_to_planet_or_location("solar-system-edge", "oxide", "huge", oxide * 5 * edge_rate)
  utils.add_asteroid_to_planet_or_location("solar-system-edge", "carbonic", "huge", carbon * 4 / 5 * edge_rate)
end
