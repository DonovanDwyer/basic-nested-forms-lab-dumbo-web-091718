class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(name: 'First Ingredient')
    @recipe.ingredients.build(name: 'Second Ingredient')
  end

  def create
    @recipe = Recipe.create(title: recipe_params[:title])
    @recipe.ingredients.create(recipe_params[:ingredients_attributes]["0"])
    @recipe.ingredients.create(recipe_params[:ingredients_attributes]["1"])
    # byebug
    redirect_to @recipe
  end

  private

    def recipe_params
      params.require(:recipe).permit(
        :title,
        ingredients_attributes: [
          :name,
          :quantity
        ]
      )
    end
end
