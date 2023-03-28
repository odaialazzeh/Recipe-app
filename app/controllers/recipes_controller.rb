class RecipesController < ApplicationController
  # load_and_authorize_resource

  def index
    @recipees = Recipe.all
  end

  def new
  end
end
  