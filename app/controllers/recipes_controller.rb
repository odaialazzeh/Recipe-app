class RecipesController < ApplicationController
  def index
    @recipes = current_user.recipes
  end

  def new
    @new_recipe = Recipe.new
  end

  def create 
    @food = Recipe.new(params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public))
    @food.user = current_user
    if @food.save
      flash[:success] = 'Food successfully added!'
      redirect_to user_recipes_path(current_user)
    else
      flash.now[:error] = 'Food creation failed!'
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if @recipe.destroy
      flash[:success] = 'Post deleted successfully'
      redirect_to root_path
    else
      flash.now[:error] = 'Error: Post could not be deleted'
    end
  end
end
