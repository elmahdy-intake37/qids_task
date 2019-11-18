class ReviewController < ApplicationController
  def index
    if params[:search]
      @reviews = Review.search(params[:search])
    else
      @reviews = Review.all
    end
  end
end
