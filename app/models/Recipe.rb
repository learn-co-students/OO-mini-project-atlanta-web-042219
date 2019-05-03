class Recipe
	attr_accessor :name, :recipe_ingredients
	@@all = []

	def self.all
		@@all
	end

	def initialize(name)
		@name = name
		@@all << self
	end

	def add_ingredients(ingredients_array)
		ingredients_array.each {|ingredient|
			RecipeIngredient.new(self, ingredient)
		}
	end

	def recipe_ingredients # link Recipe to Ingredient
		RecipeIngredient.all.select {|ri| ri.recipe == self}
	end

	def recipe_cards # that have this recipe on it
		RecipeCard.all.select {|rc| rc.recipe == self}
	end

	def ingredients # used in this recipe
		self.recipe_ingredients.map(&:ingredient)
	end

	def allergens #returns ingredients in this recipe that any user is allergic to
		self.ingredients.select {|ingredient| ingredient.allergies.count > 0 }
	end

	def users # who know this recipe
		self.recipe_cards.map(&:user)
	end

	def self.most_popular
		self.all.max_by {|recipe| recipe.recipe_cards.count}
	end
end
