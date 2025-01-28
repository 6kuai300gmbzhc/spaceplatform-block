local script_utils = require("script_utils")
local min = -0.02
local max = 0.02
local e = defines.events
local generate_table = {
    ["generate-asteroid-rocket"] =
    {
        asteroid_probility = 1,
        accept_size = { "big", "huge", "target" },
        generate_type = "medium",
        chunk_probility = 0.2
    },
    ["generate-asteroid-magazine"] =
    {
        asteroid_probility = 0.1,
        accept_size = { "medium", "big", "huge", "target" },
        generate_type = "small",
        chunk_probility = 0.1
    }
}

local accept_type =
{
    ["metallic"] = { "tungsten", "holmium" },
    ["carbonic"] = { "organic" },
    ["oxide"] = { "aquilo" }
}
local generate_asteroid_common = function(event)
    local target = event.target_entity
    if not target or not target.valid then return end
    local surface = game.surfaces[event.surface_index]
    if not surface or not surface.valid or not surface.platform or not surface.platform.valid then return end
    local platform = surface.platform
    local target_name = target.name
    for name, table in pairs(generate_table) do
        if event.effect_id == name then
            if math.random() >= table.asteroid_probility then break end           --大于概率就直接忽略
            if not script_utils.contains(target_name, "asteroid") then return end --只对星岩生效
            local accept_size = table.accept_size
            for _, size in pairs(accept_size) do                                  --匹配大小
                if script_utils.contains(target_name, size) then
                    for type, chunks in pairs(accept_type) do                     --匹配类型
                        if script_utils.contains(target_name, type) then
                            --固定生成对应的星岩
                            surface.create_entity
                            {
                                position = event.target_position or target.position,
                                name = table.generate_type .. "-" .. type .. "-asteroid"
                            }
                            --概率生成稀有的星块
                            for _, chunk in pairs(chunks) do
                                if math.random() <= table.chunk_probility then
                                    platform.create_asteroid_chunks({
                                        {
                                            name = chunk .. "-asteroid-chunk",
                                            position = event.target_position or target.position,
                                            movement = script_utils.get_random_vector(min, max)
                                        }
                                    })
                                end
                            end
                            break --没有continue，很痛苦，这辈子也不会用goto的
                        end
                    end
                    break
                end
            end
            --这里就返回了,连用三个break无语了
            break
        end
    end
end

local target = { "metallic", "carbonic", "oxide" }
local generate_asteroid_artillery = function(event)
    if event.effect_id == "generate-asteroid-artillery" then --重炮，先摧毁地板，再放陨石上去
        local surface = game.surfaces[event.surface_index]
        if not surface or not surface.valid or not surface.platform or not surface.platform.valid then return end
        local tiles = {}
        for x = -3, 4 do
            for y = -3, 4 do
                table.insert(tiles,
                    { position = { x + event.target_position.x, y + event.target_position.y }, name = "empty-space" })
            end
        end
        surface.set_tiles(tiles, true, false) --不强制摧毁上面的东西
        surface.create_entity { position = event.target_position, name = target[event.tick % 3 + 1] .. "-asteroid-target" }
    end
end
local generate_asteroid = {
    common = { events = { [e.on_script_trigger_effect] = generate_asteroid_common } },
    artillery = { events = { [e.on_script_trigger_effect] = generate_asteroid_artillery } }
}
return generate_asteroid
