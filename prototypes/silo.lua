local sol_silo = table.deepcopy(data.raw["rocket-silo"]["rocket-silo"])
sol_silo.name = "sol-rocket-silo"
sol_silo.active_energy_usage = "40MW"
sol_silo.energy_usage = "40MW"
sol_silo.rocket_parts_required = 1
sol_silo.allow_productivity = false
sol_silo.crafting_speed = 1
sol_silo.fixed_recipe = "sol-rocket-part"
sol_silo.minable = {
  mining_time = 1,
  result = "sol-rocket-silo"
}
sol_silo.placeable_by = { item = "sol-rocket-silo", count = 1 }
data:extend { sol_silo }
