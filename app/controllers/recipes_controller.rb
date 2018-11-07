class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    2.times { @recipe.ingredients.build }
  end

  def create
    @recipe = Recipe.create(recipe_params)
    byebug
    redirect_to @recipe
  end

  private

  def recipe_params
    byebug
    params.require(:recipe).permit(:title, ingredients_attributes: [:quantity, :name])
  end
end
