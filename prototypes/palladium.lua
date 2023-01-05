local util = require("data-util");

data:extend({
  {
    type = "item",
    name = "palladium-powder",
    icon = "__bzgold__/graphics/icons/palladium-powder.png",
    icon_size = 64,
    subgroup = "raw-resource",
    order = "b[palladium-powder]",
    stack_size = util.get_stack_size(100),
  },
  {
    type = "item",
    name = "palladium-ingot",
    icon = "__bzgold__/graphics/icons/palladium-ingot.png",
    icon_size = 128,
    subgroup = "raw-resource",
    order = "b[palladium-ingot]",
    stack_size = util.get_stack_size(100),
  },
  {
    type = "recipe",
    name = "palladium-ingot",
    category = "smelting",
    order = "d[palladium-ingot]",
    enabled = true,
    energy_required = 1.6,
    ingredients = {{"palladium-powder", 1}},
    results = {{"palladium-ingot", 1}},
  },
})
data:extend({
  {
    type = "technology",
    name = "palladium-processing",
    icons = {
      {
        icon = "__bzgold__/graphics/icons/palladium-ingot.png",
        icon_size = 128,
      },
    },
    effects = {
      { type = "unlock-recipe", recipe = "palladium-ingot" },
      { type = "unlock-recipe", recipe = "rich-copper" },
    },
    unit = {
      count = 50, time = 30,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
      },
    },
    prerequisites = mods["space-exploration"] and {"rocket-science-pack"} or {"chemical-science-pack"},
    order = "b-b",
  },
})
if mods.bztitanium then
data:extend({
  {
    type = "item",
    name = "titanium-palladium-flange",
    icon = "__bzgold__/graphics/icons/titanium-palladium-alloy.png",
    icon_size = 128,
    subgroup = "intermediate-product",
    order = "b[palladium-ingot]",
    stack_size = 100,
  },
  {
    type = "recipe",
    name = "titanium-palladium-flange",
    category = "advanced-crafting",
    order = "d[palladium-ingot]",
    enabled = true,
    energy_required = 5,
    ingredients = {{"palladium-ingot", 1}, {util.titanium_plate, 4}},
    results = {{"titanium-palladium-flange", 5}},
  },
})
util.add_unlock("palladium-processing", "titanium-palladium-flange")
util.set_to_founding("titanium-palladium-flange")
end