local script_utils = {}

---@param storage_name string
---@param entity LuaEntity
function script_utils.save_to_storage(storage_name, entity)
    local storage_list = storage[storage_name] or {}
    table.insert(storage_list, entity)
    storage[storage_name] = storage_list
end

---@param storage_name string
---@param entity LuaEntity
function script_utils.delete_storage_entity(storage_name, entity)
    for i, storage_entity in pairs(storage[storage_name]) do
        if storage_entity == entity
        then
            storage[storage_name][i] = nil
            break
        end
    end
end

---@param min integer
---@param max integer
function script_utils.get_random_number(min, max)
    return min + (max - min) * math.random()
end

---@param min integer
---@param max integer
function script_utils.get_random_vector(min, max)
    return { script_utils.get_random_number(min, max), script_utils.get_random_number(min, max) }
end

---@param vector table
function script_utils.round_vector(vector)
    local out = {}
    for i, value in pairs(vector) do
        table.insert(out, math.floor(value))
    end
    return out
end

---@param src string
---@param dest string
---@return boolean
function script_utils.contains(src, dest)
    local pos = string.find(src, dest)
    if pos then
        return true
    else
        return false
    end
end

return script_utils
