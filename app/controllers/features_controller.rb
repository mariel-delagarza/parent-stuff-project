class FeaturesController < ApplicationController

  def new
    @feature = place_id.feature.new
  end


end
