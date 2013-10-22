class HomeController < ApplicationController
  def single
  end

  def index
  	@latest_post = Post.includes(:category).where("categories.status" => 1)
  end
end
