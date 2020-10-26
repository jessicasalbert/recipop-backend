class Api::V1::RecipesController < ApplicationController

    def index
        recipes = Recipe.search_name(params[:search])
        render json: recipes
    end

    def show
        recipe = Recipe.find(params[:id])
        #recipe.instructions = recipe.format_instructions
        recipe.youtube_url = recipe.format_youtube
        render json: {recipe: recipe, comments: recipe.format_comments}
    end

    def create
        recipe = Recipe.create(recipe_params)
        render json: recipe
    end
        

    private

    def recipe_params
        params.require(:recipe).permit!
    end

end
