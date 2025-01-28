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
local mothership = table.deepcopy(data.raw.planet["nauvis"])
mothership.name = "mothership"
mothership.icon = "__spaceship-beginning__/graphics/icons/mothership.png"
mothership.starmap_icon = "__spaceship-beginning__/graphics/icons/starmap-mothership.png"
mothership.starmap_icon_size=64
mothership.gravity_pull = 0
mothership.distance=mothership.distance*1.5
mothership.orientation = 0.25
mothership.magnitude = 0.5
mothership.order="z"
mothership.map_gen_settings=nil
mothership.surface_properties =
{
  ["day-night-cycle"] = 0,
  ["solar-power"] = 300,
  pressure = 0,
  gravity = 0
}
mothership.draw_orbit=false
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
        length = 100,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(mothership_asteroid)
    },
    {
        type = "space-connection",
        name = "mothership-nauvis",
        subgroup = "planet-connections",
        from = "mothership",
        to = "nauvis",
        order = "b-a",
        length = 100,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(mothership_asteroid)
    },
    {
        type = "space-connection",
        name = "mothership-gleba",
        subgroup = "planet-connections",
        from = "mothership",
        to = "gleba",
        order = "c-a",
        length = 100,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(mothership_asteroid)
    },
    {
        type = "space-connection",
        name = "mothership-vulcanus",
        subgroup = "planet-connections",
        from = "mothership",
        to = "vulcanus",
        order = "d-a",
        length = 100,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(mothership_asteroid)
    },
    {
        type = "space-connection",
        name = "mothership-vulcanus",
        subgroup = "planet-connections",
        from = "mothership",
        to = "vulcanus",
        order = "e-a",
        length = 100,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(mothership_asteroid)
    },
    {
        type = "space-connection",
        name = "mothership-aquilo",
        subgroup = "planet-connections",
        from = "mothership",
        to = "aquilo",
        order = "f-a",
        length = 100,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.fulgora_aquilo)
    },
    {
        type = "space-connection",
        name = "mothership-solar-system-edge",
        subgroup = "planet-connections",
        from = "mothership",
        to = "solar-system-edge",
        order = "g-a",
        length = 100,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.aquilo_solar_system_edge)
    },
})