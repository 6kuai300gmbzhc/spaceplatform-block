local ar = {
  ammo_category = "artillery-shell",
  cooldown = 200,
  min_range = 32,
  movement_slow_down_factor = 0,
  projectile_center = {
    -0.15625,
    -0.078119999999999994
  },
  projectile_creation_distance = 1.6000000000000001,
  range = 224,
  shell_particle = {
    center = {
      0,
      -0.5
    },
    creation_distance = 0.5,
    creation_distance_orientation = 0.4,
    direction = 0.4,
    direction_deviation = 0.05,
    height = 1,
    name = "artillery-shell-particle",
    speed = 0.1,
    speed_deviation = 0.1,
    starting_frame_speed = 0.5,
    starting_frame_speed_deviation = 0.5,
    use_source_position = true,
    vertical_speed = 0.05,
    vertical_speed_deviation = 0.01
  },
  sound = {
    filename = "__base__/sound/fight/artillery-shoots-1.ogg",
    game_controller_vibration_data = {
      duration = 150,
      low_frequency_vibration_intensity = 1,
      play_for = "everything"
    },
    modifiers = {
      type = "main-menu",
      volume_multiplier = 0.9
    },
    switch_vibration_data = {
      filename = "__base__/sound/fight/artillery-shoots.bnvib",
      play_for = "everything"
    },
    volume = 0.7
  },
  type = "projectile"
}
