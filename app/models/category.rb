class Category < ActiveRecord::Base
	has_many :posts
	def self.list_categories
		Category.all
	end
end
