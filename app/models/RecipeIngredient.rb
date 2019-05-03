class RecipeIngredient
	attr_accessor :name, :recipe, :ingredient
	@@all = []

	def self.all
		@@all
	end

	def initialize(recipe, ingredient)
		@recipe = recipe
		@ingredient = ingredient
		@@all << self
	end
end
