local utils=require("utils")

data.raw.technology["rocket-silo"].enabled=false
data.raw.technology["scrap-recycling"].enabled=false
data.raw.technology["rocket-part-productivity-stage1"].enabled=false
data.raw.technology["rocket-part-productivity-stage2"].enabled=false
data.raw.technology["rocket-part-productivity-stage3"].enabled=false
data.raw.technology["personal-roboport-equipment"].enabled=false
data.raw.technology["personal-roboport-mk2-equipment"].enabled=false
data.raw.technology["construction-robotics"].enabled=false
data.raw.technology["rocket-silo"].enabled=false
data.raw.technology["foundation"].enabled=false
utils.set_prerequisites("space-platform-thruster",{"electric-engine","low-density-structure","processing-unit"})
utils.remove_recipes("quantum-processor",{"sol-rocket-silo"})
utils.add_recipes("space-platform-thruster",{"reverse-thruster"})