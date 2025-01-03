
data:extend {
    {
        type = "custom-input",
        name = "leave_hub",
        key_sequence = 'RETURN',
        alternative_key_sequence = "G",
        action = "lua",
        localised_name = { "description.leave-hub" }
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
data.raw["rocket-silo"]["rocket-silo"].rocket_parts_required = 30
data.raw["temporary-container"]["cargo-pod-container"].time_to_live = 10
