class Api::V1::UsersController < ApplicationController
    def index
        users = User.all
        render json: users
    end

    def show
        user = User.find(params[:id])
        user.recipes.each do |rec|
            rec.instructions = rec.format_instructions
        end
        render json: { id: user.id, username: user.username, fav_recipes: user.recipes}
    end

    def login
        username = params[:search]
        user = User.find_or_create_by(username: username)
        render json: { id: user.id, username: user.username, favorites: user.favorites}
    end
end
