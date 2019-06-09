class StaticPagesController < ApplicationController
  def home
    @reivew = current_user.reviews.build if logged_in?
  end

  def help
  end

  def about
  end

  def contact
  end
  
end
