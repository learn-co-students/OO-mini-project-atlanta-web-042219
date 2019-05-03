class Ingredient
	attr_accessor :name
	@@all = []

	def self.all
		@@all
	end

	def initialize(name_of_ingredient)
		@name = name_of_ingredient
		@@all << self
	end

	def self.most_common_allergen
		max = self.all.max_by {|ingredient| ingredient.allergies.count }
		return "No one is allergic to anything." if max.allergies.count == 0
		max
	end

	def allergies
		Allergy.all.select {|allergy| allergy.ingredient == self}
	end
	
	def allergic_users
		self.allergies.map(&:user)
	end
end
