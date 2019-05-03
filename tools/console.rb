require_relative '../config/environment.rb'

andrew = User.new("Andrew Allen")
han = User.new("Han Xu")

parsley = Ingredient.new("Parsley")
bread = Ingredient.new("Bread")
butter = Ingredient.new("Butter")
banana = Ingredient.new("Banana")
pb = Ingredient.new("Peanut Butter")

# ...

pb_and_banana = Recipe.new("Peanut Butter and Bananas")
pb_and_banana.add_ingredients([pb, banana])

buttered_bread = Recipe.new("Butter spread on Bread")
buttered_bread.add_ingredients([butter, bread])

# ...

andrew.add_recipe_card(pb_and_banana, "1", 1)
andrew.add_recipe_card(buttered_bread, "10", 10)
andrew.add_recipe_card(buttered_bread, "9", 9)
andrew.add_recipe_card(buttered_bread, "8", 8)

andrew.declare_allergy(parsley)
andrew.declare_allergy(pb)

# ...

han.add_recipe_card(pb_and_banana, "date", 1)

han.declare_allergy(parsley)













binding.pry
