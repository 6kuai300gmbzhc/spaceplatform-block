local utils = {}

local technologies = data.raw.technology
utils.blank = {
    direction_count = 8,
    frame_count = 1,
    filename = "__spaceplatform-block__/graphics/blank.png",
    width = 1,
    height = 1,
    priority = "low"
}
---@param name string
---@param prerequisites string[]?
function utils.set_prerequisites(name, prerequisites)
    local technology = technologies[name]
    technology.prerequisites = prerequisites
end

---@param name string
---@param prerequisites string[]
function utils.add_prerequisites(name, prerequisites)
    local technology = data.raw.technology[name]
    technology.prerequisites = technology.prerequisites or {}
    for _, prerequisite in pairs(prerequisites) do
        technology.prerequisites[#technology.prerequisites + 1] = prerequisite
    end
end

---@param name string
---@param trigger data.TechnologyTrigger
function utils.set_trigger(name, trigger)
    local technology = technologies[name]
    technology.research_trigger = trigger
    technology.unit = nil
end

---@param name string
---@param unit data.TechnologyUnit
function utils.set_unit(name, unit)
    local technology = technologies[name]
    technology.unit = unit
    technology.research_trigger = nil
end

---@param name string
---@param recipes string[]
function utils.set_recipes(name, recipes)
    local technology = technologies[name]
    technology.effects = {}
    for i, effect in pairs(recipes) do
        technology.effects[i] = {
            type = "unlock-recipe",
            recipe = effect,
        }
    end
end

---@param name string
---@param recipes string[]
function utils.add_recipes(name, recipes)
    local technology = technologies[name]
    technology.effects = technology.effects or {}
    local len = #technology.effects
    for i = 1, #recipes do
        technology.effects[len + i] = {
            type = "unlock-recipe",
            recipe = recipes[i],
        }
    end
end

---@param name string
---@param recipes string[]
function utils.remove_recipes(name, recipes)
    local map = {}
    for _, recipe in pairs(recipes) do
        map[recipe] = true
    end
    local effects = technologies[name].effects --[[@as TechnologyModifier]]
    for i = #effects, 1, -1 do
        if map[effects[i].recipe] then
            table.remove(effects, i)
        end
    end
end

function utils.insert_recipe(name, recipe, position)
    local technology = technologies[name]
    technology.effects = technology.effects or {}
    table.insert(technology.effects, position, {
        type = "unlock-recipe",
        recipe = recipe,
    })
end

---@param name string
---@param packs string[]
function utils.remove_packs(name, packs)
    local map = {}
    for _, pack in pairs(packs) do
        map[pack] = true
    end
    local ingredients = technologies[name].unit.ingredients
    for i = #ingredients, 1, -1 do
        if map[ingredients[i][1]] then
            table.remove(ingredients, i)
        end
    end
end

--@param name string
--@param pack string
function utils.add_pack(name, pack)
    local ingredients = technologies[name].unit.ingredients
    local has_pack = false
    for _, ingredient in pairs(ingredients) do
        if ingredient[1] == pack then
            has_pack = true
            break
        end
    end
    if not has_pack then
        table.insert(ingredients, { pack, 1 })
    end
end

--@param name string
--@param count uint
function utils.set_count(name, count)
    technologies[name].unit.count = count
end

--@param location string
--@param asteroid_name string
--@param asteroid_type string
--@param probability float
function utils.add_asteroid_to_planet_or_location(location, asteroid_name, asteroid_type, probability)
    local angles = {
        chunk = 1,
        small = 1,
        medium = 1,
        big = 1,
        huge = 1
    }
    local default_speed = 0.016666666666666665
    local new_asteroid_def = {}
    local inserted_asteroid_name = ""
    if asteroid_type == "chunk" then
        inserted_asteroid_name = asteroid_name .. "-asteroid-chunk"
        new_asteroid_def.type = "asteroid-chunk"
    else
        inserted_asteroid_name = asteroid_type .. "-" .. asteroid_name .. "-asteroid"
    end
    new_asteroid_def.speed = default_speed
    new_asteroid_def.asteroid = inserted_asteroid_name
    new_asteroid_def.probability = probability
    new_asteroid_def.angle_when_stopped = angles[asteroid_type]
    local target = data.raw.planet[location] or data.raw["space-location"][location]
    local definations = target.asteroid_spawn_definitions
    for i, defination in pairs(definations) do
        if defination.type == new_asteroid_def.type and defination.asteroid == new_asteroid_def.asteroid then
            --合并一下
            defination.probability = defination.probability + new_asteroid_def.probability
            return
        end
    end
    --找不到就加新的
    table.insert(definations, new_asteroid_def)
end

--@param connection string
--@param asteroid_name string
--@param asteroid_type string
--@param probability float
--@param distance float
function utils.add_asteroid_to_connection(connection, asteroid_name, asteroid_type, probability, distance)
    local angles = {
        chunk = 1,
        small = 1,
        medium = 1,
        big = 1,
        huge = 1
    }
    local default_speed = 0.016666666666666665
    local inserted_asteroid_name = ""
    if asteroid_type == "chunk" then
        inserted_asteroid_name = asteroid_name .. "-asteroid-chunk"
    else
        inserted_asteroid_name = asteroid_type .. "-" .. asteroid_name .. "-" .. asteroid_type
    end

    local spawn_point = {}
    spawn_point.angle_when_stopped = angles[asteroid_type]
    spawn_point.distance = distance
    spawn_point.probability = probability
    spawn_point.speed = default_speed

    local find = false
    for i, definition in pairs(data.raw["space-connection"][connection].asteroid_spawn_definitions) do
        if definition.asteroid == inserted_asteroid_name then
            local spawn_points = table.deepcopy(definition.spawn_points)
            table.insert(spawn_points, spawn_point)
            data.raw["space-connection"][connection].asteroid_spawn_definitions[i].spawn_points = spawn_points
            find = true
            break
        end
    end
    if not find then
        local new_definition = {}
        new_definition.spawn_points = {}
        new_definition.asteroid = inserted_asteroid_name
        if asteroid_type == "chunk" then new_definition.type = "asteroid-chunk" end
        table.insert(new_definition.spawn_points, spawn_point)
        table.insert(data.raw["space-connection"][connection].asteroid_spawn_definitions, new_definition)
    end
end

function utils.contains(element, array)
    for _, value in pairs(array) do
        if value == element then
            return true
        end
    end
    return false
end

--@param name string
--@param spcae_location string
function utils.add_space_location_to_technology(name, space_location)
    local effects = technologies[name].effects
    local has_effect = false
    for _, effect in pairs(effects) do
        if effect.type == "unlock-space-location" and effect.space_location == space_location then
            has_effect = true
            break
        end
    end
    if not has_effect then
        local effect = {
            space_location = space_location,
            type = "unlock-space-location",
            use_icon_overlay_constant = true
        }
        table.insert(effects, effect)
    end
end

--@param name string
--@param spcae_location string
function utils.remove_space_location_to_technology(name, space_location)
    local effects = technologies[name].effects
    local i = 1
    for i = #effects, 1, -1 do
        if effects[i].type == "unlock-space-location" and effects[i].space_location == space_location then
            table.remove(effects, i)
        end
    end
end

--@param name string
--@param damage double
function utils.set_ammo_damage(name, damage)
    local ammo = data.raw.ammo[name]
    local action = ammo.ammo_type.action
    local delivery = action.action_delivery or action[1].action_delivery
    local effects = delivery.target_effects or delivery[1].target_effects

    for i, effect in pairs(effects) do
        if effect.type == "damage" then
            effect.damage.amount = damage
            return
        end
    end
end

--@param vector list
function utils.revers_vector(vector)
    for i, value in pairs(vector) do
        vector[i] = -value
    end
    return vector
end

--@param name string
function utils.add_recipe_item_group(name)
    data:extend({
        {
            type = "recipe-category",
            name = name
        },
        {
            type = "item-subgroup",
            name = name,
            group = "intermediate-products",
            order = "z-" .. name
        }
    })
end

return utils
