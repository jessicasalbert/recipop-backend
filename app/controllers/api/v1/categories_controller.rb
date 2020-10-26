class Api::V1::CategoriesController < ApplicationController

    def index

        if params[:search] == "meat" 
            pork = Category.find_by(name: "Pork")
            beef = Category.find_by(name: "Beef")
            lamb = Category.find_by(name: "Lamb")
            render json: {recipes: pork.recipes + beef.recipes + lamb.recipes}
        elsif params[:search] == "chicken"
            chicken = Category.find_by(name: "Chicken")
            render json: { recipes: chicken.recipes }
        elsif params[:search] == "dessert"
            dessert = Category.find_by(name: "Dessert")
            render json: { recipes: dessert.recipes }
        elsif params[:search] == "pasta"
            pasta = Category.find_by(name: "Pasta")
            render json: { recipes: pasta.recipes }
        elsif params[:search] == "seafood"
            seafood = Category.find_by(name: "Seafood")
            render json: { recipes: seafood.recipes }
        elsif params[:search] == "starter"
            starter = Category.find_by(name: "Starter")
            side = Category.find_by(name: "Side")
            render json: { recipes: starter.recipes + side.recipes }
        elsif params[:search] == "vegetarian"
            vegetarian = Category.find_by(name: "Vegetarian")
            vegan = Category.find_by(name: "Vegan")
            render json: { recipes: vegetarian.recipes + vegan.recipes }        
        end
    end

    def show
        category = Category.find(params[:id])
        category_recipes = category.recipes
        render json: { name: category.name, categories: category_recipes}
    end


end


# /categories/9
# /categorie/seafood
# /categories?search=seafood

# User.find_or_create_by()

# currentUserId = 