class Post < ActiveRecord::Base
	belongs_to :category
	belongs_to :user

	def get_latest_posts
		
	end
end
