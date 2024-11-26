local planets_data={}
local old_planets={"vulcanus","nauvisorbit","gleba","fulgora","aquilo"}
local new_planets={
    {
        name="platform1",
        asteroid_spawn_definitions = {
            {
              angle_when_stopped = 1,
              asteroid = "metallic-asteroid-chunk",
              probability = 0.0125,
              speed = 0.016666666666666665,
              type = "asteroid-chunk"
            },
            {
              angle_when_stopped = 1,
              asteroid = "carbonic-asteroid-chunk",
              probability = 0.0083333333333333321,
              speed = 0.016666666666666665,
              type = "asteroid-chunk"
            },
            {
              angle_when_stopped = 1,
              asteroid = "oxide-asteroid-chunk",
              probability = 0.0041666666666666661,
              speed = 0.016666666666666665,
              type = "asteroid-chunk"
            }
        },
        magnitude=0.5,
        distance=25
    },
    {
        name="platform2",
        asteroid_spawn_definitions = {
            {
              angle_when_stopped = 1,
              asteroid = "metallic-asteroid-chunk",
              probability = 0.0125,
              speed = 0.016666666666666665,
              type = "asteroid-chunk"
            },
            {
              angle_when_stopped = 1,
              asteroid = "carbonic-asteroid-chunk",
              probability = 0.0083333333333333321,
              speed = 0.016666666666666665,
              type = "asteroid-chunk"
            },
            {
              angle_when_stopped = 1,
              asteroid = "oxide-asteroid-chunk",
              probability = 0.0041666666666666661,
              speed = 0.016666666666666665,
              type = "asteroid-chunk"
            }
        },
        magnitude=0.6,
        distance=27
    },
    {
        name="platform3",
        asteroid_spawn_definitions = {
            {
              angle_when_stopped = 1,
              asteroid = "metallic-asteroid-chunk",
              probability = 0.0125,
              speed = 0.016666666666666665,
              type = "asteroid-chunk"
            },
            {
              angle_when_stopped = 1,
              asteroid = "carbonic-asteroid-chunk",
              probability = 0.0083333333333333321,
              speed = 0.016666666666666665,
              type = "asteroid-chunk"
            },
            {
              angle_when_stopped = 1,
              asteroid = "oxide-asteroid-chunk",
              probability = 0.0041666666666666661,
              speed = 0.016666666666666665,
              type = "asteroid-chunk"
            }
        },
        magnitude=0.7,
        distance=29
    },
    {
        name="platform4",
        asteroid_spawn_definitions = {
            {
              angle_when_stopped = 1,
              asteroid = "metallic-asteroid-chunk",
              probability = 0.0125,
              speed = 0.016666666666666665,
              type = "asteroid-chunk"
            },
            {
              angle_when_stopped = 1,
              asteroid = "carbonic-asteroid-chunk",
              probability = 0.0083333333333333321,
              speed = 0.016666666666666665,
              type = "asteroid-chunk"
            },
            {
              angle_when_stopped = 1,
              asteroid = "oxide-asteroid-chunk",
              probability = 0.0041666666666666661,
              speed = 0.016666666666666665,
              type = "asteroid-chunk"
            }
        },
        magnitude=0.8,
        distance=31
    }
}
local connetcions={
    {
        from = "fulgora",
        to = "platform1",
        length = 15000
    },
    {
        from = "aquilo",
        to = "platform1",
        length = 10000
    },
    {
        from = "platform1",
        to = "platform2",
        length = 20000
    },
    {
        from = "platform2",
        to = "platform3",
        length = 30000
    },
    {
        from = "platform3",
        to = "platform4",
        length = 40000
    },
    {
        from = "platform4",
        to = "solar-system-edge",
        length = 40000
    }
}
planets_data["old_planets"]=old_planets
planets_data["new_planets"]=new_planets
planets_data["connetcions"]=connetcions
function planets_data.getplanets()
  local planet={"vulcanus","nauvisorbit","gleba","fulgora","aquilo"}
  for _,new in pairs(planets_data["new_planets"])do
    table.insert(planet,new.name)
  end
  return planet
end
return planets_data