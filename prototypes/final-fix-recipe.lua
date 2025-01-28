--修复方块的回收配方
local cubes = { "black-cube", "white-cube", "blue-cube", "gold-cube" }
local max_level = settings.startup["cube-level"].value
for i, name in pairs(cubes) do
    for j = 1, max_level do
        local recipe = data.raw.recipe[name .. "-" .. (j + '0') .. "-recycling"]
        if recipe then
            recipe.results = { { type = "item", name = "black-cube-1", amount = 1 } }
            recipe.allow_productivity = false
        end
    end
end
