local nauvisorbit=table.deepcopy(data.raw.planet.nauvis)
nauvisorbit.magnitude=0.5
nauvisorbit.name="nauvisorbit"
nauvisorbit.orientation=0.25
data.extend{nauvisorbit}
require("prototypes/item")
require("prototypes/recipe")
require("prototypes/technology")
require("prototypes/plant")
require("prototypes/asteroid")
require("prototypes/weapon")
data.raw["rocket-silo"]["rocket-silo"].rocket_parts_required = 30
-- require("asteroids")