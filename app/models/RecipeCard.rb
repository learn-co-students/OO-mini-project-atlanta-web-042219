class RecipeCard
	attr_accessor :user, :recipe, :date, :rating
	@@all = []

	def self.all
		@@all
	end

	def initialize(user, recipe, date, rating)
		@user = user
		@recipe = recipe
		@date = date
		@rating = rating

		@@all << self
	end
end
