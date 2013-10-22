class Category < ActiveRecord::Base
	def self.list_categories
		Category.all
	end
end
