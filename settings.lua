data:extend {
    {
        type = "bool-setting",
        name = "global-power",
        setting_type = "startup",
        default_value = false,
        order = "a"
    },
    {
        type = "int-setting",
        name = "cube-level",
        setting_type = "startup",
        default_value = 5,
        order = "a"
    },
    {
        type = "string-setting",
        name = "gamemode",
        setting_type = "startup",
        default_value = "normal",
        allowed_values = { "normal", "hardcore", "fly-to-die" },
        order = "a"
    },
    {
        type = "double-setting",
        name = "hardcore-metallic-asteroid",
        setting_type = "startup",
        default_value = 0.015,
        order = "b"
    },
    {
        type = "double-setting",
        name = "hardcore-oxide-asteroid",
        setting_type = "startup",
        default_value = 0.004,
        order = "c"
    },
    {
        type = "double-setting",
        name = "hardcore-carbonic-asteroid",
        setting_type = "startup",
        default_value = 0.01,
        order = "d"
    },
    {
        type = "double-setting",
        name = "hardcore-sol-rate",
        setting_type = "startup",
        default_value = 1,
        order = "e"
    },
    {
        type = "double-setting",
        name = "hardcore-vulcanus-rate",
        setting_type = "startup",
        default_value = 2,
        order = "f"
    },
    {
        type = "double-setting",
        name = "hardcore-nauvisorbit-rate",
        setting_type = "startup",
        default_value = 2.6,
        order = "g"
    },
    {
        type = "double-setting",
        name = "hardcore-gleba-rate",
        setting_type = "startup",
        default_value = 1.4,
        order = "h"
    },
    {
        type = "double-setting",
        name = "hardcore-fulgora-rate",
        setting_type = "startup",
        default_value = 1.6,
        order = "i"
    },
    {
        type = "double-setting",
        name = "hardcore-aquilo-rate",
        setting_type = "startup",
        default_value = 2,
        order = "j"
    },
    {
        type = "double-setting",
        name = "hardcore-solar-system-edge-rate",
        setting_type = "startup",
        default_value = 2,
        order = "k"
    },
    {
        type = "double-setting",
        name = "hardcore-safe-radius",
        setting_type = "startup",
        default_value = 40,
        order = "l"
    },
    {
        type = "double-setting",
        name = "fly-to-die-speed",
        setting_type = "startup",
        default_value = 10,
        order = "m"
    },
}
--影响陨石生成设定，感觉需要每个模式单独一个文件
