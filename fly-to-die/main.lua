--对飞到死模式的修改。
require("fly-to-die.change-technology")
require("fly-to-die.change-entity")
require("fly-to-die.change-item")
data.raw["space-connection"]["nauvis-vulcanus"]=nil
data.raw["space-connection"]["gleba-fulgora"]=nil
data.raw["space-connection"]["gleba-aquilo"]=nil
--调剩余航道的距离，10km/s飞10h，因为可以随便往回飞，所以不要太远
local hour=3600
local default_speed=10
local default_time=10*hour


for name,planet in pairs(data.raw.planet) do
    if name~="nauvis" and name~="sol" and name~="mothership" then
        local location=table.deepcopy(planet)
        location.type="space-location"
        location.name=location.name.."-orbit"
        location.localised_name={"space-location-name."..planet.name}--重载翻译名字
        data:extend{location}
        planet.distance=10000
        planet.draw_orbit=false
        planet.hidden=true
        planet.hidden_in_factoriopedia=true

        --遍历航道，把来和去换成他
        for connection_name,connection in pairs(data.raw["space-connection"]) do
            if connection.from==name then
                connection.from=location.name
            end
            if connection.to==name then
                connection.to=location.name
            end
        end
    end
end
data.raw["space-connection"]["sol-vulcanus"].length=default_speed*default_time
data.raw["space-connection"]["vulcanus-gleba"].length=default_speed*default_time
data.raw["space-connection"]["nauvis-gleba"].length=default_speed*default_time
data.raw["space-connection"]["nauvis-fulgora"].length=default_speed*default_time
data.raw["space-connection"]["fulgora-aquilo"].length=default_speed*default_time
data.raw["space-connection"]["aquilo-solar-system-edge"].length=default_speed*default_time
data.raw["space-connection"]["solar-system-edge-shattered-planet"].length=default_speed*default_time