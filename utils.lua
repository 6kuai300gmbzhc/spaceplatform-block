local utils = {}

local technologies = data.raw.technology

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
        technology.prerequisites[#technology.prerequisites+1] = prerequisite
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
function utils.add_pack(name,pack)
    local ingredients = technologies[name].unit.ingredients
    local has_pack=false
    for _,ingredient in pairs(ingredients) do
        if ingredient[1]==pack then
            has_pack=true
            break
        end
    end
    if not has_pack then
        table.insert(ingredients,{pack,1})
    end
end

--@param name string
--@param count uint
function utils.set_count(name,count)
    technologies[name].unit.count=count
end


--@param planet string
--@param asteroid_name string
--@param asteroid_type string
--@param probability float
function utils.add_asteroid_to_planet(planet,asteroid_name,asteroid_type,probability)
    local angles={
        chunk = 1,
        small = 0.7,
        medium = 0.6,
        big = 0.5,
        huge = 0.4
    }
    local default_speed= 0.016666666666666665
    local new_asteroid_def={}
    local inserted_asteroid_name=""
    if asteroid_type=="chunk" then
        inserted_asteroid_name=asteroid_name.."-asteroid-chunk"
        new_asteroid_def.type="asteroid-chunk"
    else
        inserted_asteroid_name=asteroid_type.."-"..asteroid_name.."-"..asteroid_type
    end
    new_asteroid_def.speed=default_speed
    new_asteroid_def.asteroid=inserted_asteroid_name
    new_asteroid_def.probability=probability
    new_asteroid_def.angle_when_stopped=angles[asteroid_type]
    table.insert(data.raw.planet[planet].asteroid_spawn_definitions,new_asteroid_def)
    
end

--@param connection string
--@param asteroid_name string
--@param asteroid_type string
--@param probability float
--@param distance float
function utils.add_asteroid_to_connection(connection,asteroid_name,asteroid_type,probability,distance)
    local angles={
        chunk = 1,
        small = 0.7,
        medium = 0.6,
        big = 0.5,
        huge = 0.4
    }
    local default_speed= 0.016666666666666665
    local inserted_asteroid_name=""
    if asteroid_type=="chunk" then
        inserted_asteroid_name=asteroid_name.."-asteroid-chunk"
    else
        inserted_asteroid_name=asteroid_type.."-"..asteroid_name.."-"..asteroid_type
    end

    local spawn_point={}
    spawn_point.angle_when_stopped=angles[asteroid_type]
    spawn_point.distance=distance
    spawn_point.probability=probability
    spawn_point.speed=default_speed

    local find=false
    for i,definition in pairs(data.raw["space-connection"][connection].asteroid_spawn_definitions) do
        if definition.asteroid==inserted_asteroid_name then
            local spawn_points=table.deepcopy(definition.spawn_points)
            table.insert(spawn_points,spawn_point)
            data.raw["space-connection"][connection].asteroid_spawn_definitions[i].spawn_points=spawn_points
            find=true
            break
        end
    end
    if not find then
        local new_definition={}
        new_definition.spawn_points={}
        new_definition.asteroid=inserted_asteroid_name
        if asteroid_type=="chunk" then new_definition.type="asteroid-chunk" end
        table.insert(new_definition.spawn_points,spawn_point)
        table.insert(data.raw["space-connection"][connection].asteroid_spawn_definitions,new_definition)
    end
end

return utils