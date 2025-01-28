data.raw.fluid["fluoroketone-hot"].max_temperature=500--发电用
data.raw.fire["fire-flame"].initial_lifetime=1800--30秒
data:extend{
    {
        icon="__spaceplatform-block__/graphics/icons/gold-cube.png",
        name="cube",
        type = "item-group",
        order="c-a"
    },
    {
        type = "recipe-category",
        name = "cube"
    },
    {
        type = "item-subgroup",
        name = "cube",
        group = "cube",
        order = "z"
    }
}
require("prototypes/entity")
require("prototypes/item")
require("prototypes/recipe")
require("prototypes/technology")
require("prototypes/plant")
require("prototypes/weapon")
require("prototypes/silo")
require("prototypes/shortcut")
require("prototypes/planets")
require("prototypes/asteroid")
require("prototypes/tips")
data.raw["rocket-silo"]["rocket-silo"].rocket_parts_required = 30
data.raw["temporary-container"]["cargo-pod-container"].time_to_live = 10
