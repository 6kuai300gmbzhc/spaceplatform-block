data.raw["artillery-projectile"]["artillery-projectile"].action.action_delivery.target_effects[1].action.action_delivery.target_effects=
{
    {
      damage = {
        amount = 10000,
        type = "physical"
      },
      type = "damage"
    },
    {
      damage = {
        amount = 10000,
        type = "explosion"
      },
      type = "damage"
    }
}
data.raw.stream["flamethrower-fire-stream"].action={
  {
    action_delivery = {
      target_effects = {
        {
          apply_damage_to_trees = false,
          damage = {
            amount = 3,
            type = "fire"
          },
          type = "damage"
        }
      },
      type = "instant"
    },
    radius = 1,
    type = "area"
  }
}