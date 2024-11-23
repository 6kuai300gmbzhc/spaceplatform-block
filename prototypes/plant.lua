local plants={"yumako-tree","jellystem"}
for _,plant in pairs(plants) do
    local tile_restriction=data.raw["plant"][plant].autoplace.tile_restriction
    table.insert(tile_restriction,"space-platform-foundation")
end