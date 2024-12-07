local nauvisorbit=table.deepcopy(data.raw.planet.nauvis)
nauvisorbit.magnitude=0.5
nauvisorbit.name="nauvisorbit"
nauvisorbit.orientation=0.25
data.extend{nauvisorbit}
data:extend{
    {
        type = "custom-input",
        name = "leave_hub",
        key_sequence = 'RETURN',
        alternative_key_sequence="G",
        action="lua",
        localised_name={"description.leave-hub"}
    }
}
require("prototypes/item")
require("prototypes/recipe")
require("prototypes/technology")
require("prototypes/plant")
require("prototypes/asteroid")
require("prototypes/weapon")
require("prototypes/shortcut")
data.raw["rocket-silo"]["rocket-silo"].rocket_parts_required = 30