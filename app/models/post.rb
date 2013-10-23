class Post < ActiveRecord::Base
	belongs_to :category
	belongs_to :user
	has_many :comments, dependent: :destroy

	def self.latest_posts
		Post.where(:status => 1).order('id DESC').limit('5')
	end
end
