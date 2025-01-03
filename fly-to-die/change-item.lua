local init_entities = data.raw["space-platform-starter-pack"]["mothership-pack"].trigger.action_delivery.source_effects

table.insert(init_entities, {
    entity_name = "fly-to-die-thruster",
    type = "create-entity",
    offsets = { { 0, 0 } }
})
