# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'net/http'
require 'open-uri'
require 'json'

Recipe.destroy_all
Category.destroy_all

#Seed categories
endpoint = 'https://www.themealdb.com/api/json/v1/1/categories.php'
data = Net::HTTP.get(URI(endpoint))
data = JSON.parse(data)
data["categories"].each do |cat|
    Category.create(name: cat["strCategory"])
end

#Seed recipes
(52764..53031).each do |id| 
    endpoint = 'https://www.themealdb.com/api/json/v1/1/lookup.php?i=' + id.to_s
    data = Net::HTTP.get(URI(endpoint))
    data = JSON.parse(data)
    if data["meals"]
        recipe = data["meals"][0]
        category = Category.find_by(name: recipe["strCategory"])
        newRecipe = Recipe.new(name: recipe["strMeal"], category_id: category.id, region: recipe["strArea"], instructions: recipe["strInstructions"], image_url: recipe["strMealThumb"], youtube_url: recipe["strYoutube"], ingredients: [], measurements: [], tags: recipe["strTags"])
        if recipe["strIngredient1"] && recipe["strIngredient1"] != ""
            newRecipe["ingredients"] << recipe["strIngredient1"]
            newRecipe["measurements"] << recipe["strMeasure1"]
        end

        if recipe["strIngredient2"] && recipe["strIngredient2"] != ""
            newRecipe["ingredients"] << recipe["strIngredient2"]
            newRecipe["measurements"] << recipe["strMeasure2"]
        end

        if recipe["strIngredient3"] && recipe["strIngredient3"] != ""
            newRecipe["ingredients"] << recipe["strIngredient3"]
            newRecipe["measurements"] << recipe["strMeasure3"]
        end

        if recipe["strIngredient4"] && recipe["strIngredient4"] != ""
            newRecipe["ingredients"] << recipe["strIngredient4"]
            newRecipe["measurements"] << recipe["strMeasure4"]
        end

        if recipe["strIngredient5"] && recipe["strIngredient5"] != ""
            newRecipe["ingredients"] << recipe["strIngredient5"]
            newRecipe["measurements"] << recipe["strMeasure5"]
        end

        if recipe["strIngredient6"] && recipe["strIngredient6"] != ""
            newRecipe["ingredients"] << recipe["strIngredient6"]
            newRecipe["measurements"] << recipe["strMeasure6"]
        end

        if recipe["strIngredient7"] && recipe["strIngredient7"] != ""
            newRecipe["ingredients"] << recipe["strIngredient7"]
            newRecipe["measurements"] << recipe["strMeasure7"]
        end

        if recipe["strIngredient8"] && recipe["strIngredient8"] != ""
            newRecipe["ingredients"] << recipe["strIngredient8"]
            newRecipe["measurements"] << recipe["strMeasure8"]
        end
            
        if recipe["strIngredient9"] && recipe["strIngredient9"] != ""
            newRecipe["ingredients"] << recipe["strIngredient9"]
            newRecipe["measurements"] << recipe["strMeasure9"]
        end

        if recipe["strIngredient10"] && recipe["strIngredient10"] != ""
            newRecipe["ingredients"] << recipe["strIngredient10"]
            newRecipe["measurements"] << recipe["strMeasure10"]
        end

        if recipe["strIngredient11"] && recipe["strIngredient11"] != ""
            newRecipe["ingredients"] << recipe["strIngredient11"]
            newRecipe["measurements"] << recipe["strMeasure11"]
        end


        if recipe["strIngredient12"] && recipe["strIngredient12"] != ""
            newRecipe["ingredients"] << recipe["strIngredient12"]
            newRecipe["measurements"] << recipe["strMeasure12"]
        end

        if recipe["strIngredient13"] && recipe["strIngredient13"] != ""
            newRecipe["ingredients"] << recipe["strIngredient13"]
            newRecipe["measurements"] << recipe["strMeasure13"]
        end

        if recipe["strIngredient14"] && recipe["strIngredient14"] != ""
            newRecipe["ingredients"] << recipe["strIngredient14"]
            newRecipe["measurements"] << recipe["strMeasure14"]
        end

        if recipe["strIngredient15"] && recipe["strIngredient15"] != ""
            newRecipe["ingredients"] << recipe["strIngredient15"]
            newRecipe["measurements"] << recipe["strMeasure15"]
        end

        if recipe["strIngredient16"] && recipe["strIngredient16"] != ""
            newRecipe["ingredients"] << recipe["strIngredient16"]
            newRecipe["measurements"] << recipe["strMeasure16"]
        end

        if recipe["strIngredient17"] && recipe["strIngredient17"] != ""
            newRecipe["ingredients"] << recipe["strIngredient17"]
            newRecipe["measurements"] << recipe["strMeasure17"]
        end

        if recipe["strIngredient18"] && recipe["strIngredient18"] != ""
            newRecipe["ingredients"] << recipe["strIngredient18"]
            newRecipe["measurements"] << recipe["strMeasure18"]
        end
    
        if recipe["strIngredient19"] && recipe["strIngredient19"] != ""
            newRecipe["ingredients"] << recipe["strIngredient19"]
            newRecipe["measurements"] << recipe["strMeasure19"]
        end

        if recipe["strIngredient20"] && recipe["strIngredient20"] != ""
            newRecipe["ingredients"] << recipe["strIngredient20"]
            newRecipe["measurements"] << recipe["strMeasure20"]
        end
        newRecipe.save
    end
end