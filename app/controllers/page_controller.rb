class PageController < ApplicationController
  def home
  	@latest_post = Post.includes(:category).where("categories.status" => 1)
  end

  def aboutus
  end

  def post
  end

  def contactus
  end
end
