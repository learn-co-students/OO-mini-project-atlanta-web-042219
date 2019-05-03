class User
	attr_accessor :name, :most_recent_recipe
	@@all = []

	def self.all
		@@all
	end

	def initialize(name)
		@name = name
		@@all << self
	end

	def add_recipe_card(recipe, date, rating)
		@most_recent_recipe = recipe
		RecipeCard.new(self, recipe, date, rating)
	end

	def declare_allergy(ingredient)
		Allergy.new(self, ingredient)
	end

	def allergies
		Allergy.all.select {|allergy| allergy.user == self }
	end

	#ingredients that user is allergic to
	def allergens
		self.allergies.map(&:ingredient)
	end

	def recipe_cards
		RecipeCard.all.select {|rc| rc.user == self }
	end

	def recipes
		self.recipe_cards.map(&:recipe)
	end

	def top_three_recipes
		# top3 = []
		# empty = RecipeCard.new(nil, nil, "", 0)
		# 3.times {top3 << empty}
		# self.recipe_cards.each {|rc|
		# 	for k in 0..2 do
		# 		top3[k] = rc if !top3.include?(rc) && (top3[k] == empty || rc.rating > top3[k].rating)
		# 	end
		# }
		# for k in 0..2 do 
		# 	top3[k] = top3[k].recipe
		# end
		# top3.delete(nil)
		# RecipeCard.all.delete(empty)
		# top3.uniq
		top = self.recipe_cards.sort_by {|rc| rc.rating}.reverse.first(3)
	end

	#returns a hash that contains all recipes
	#{recipe => array of ingredients, etc}
	def cookbook
		hash = {}
		self.recipes.each {|recipe| hash[recipe] = recipe.ingredients }
	end

	def safe_recipes
		# self.cookbook.select {|recipe, ingredients|
		# 	allergy_check = true
		# 	ingredients.each {|ingredient| allergy_check = false if self.allergens.include?(ingredient) }
		# 	allergy_check
		# }.keys
		self.recipes.reject {|recipe|
			recipe.ingredients.any? {|ingredient|
				self.allergens.include?(ingredient)
			}
		}
	end
end
