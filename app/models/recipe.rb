class Recipe < ApplicationRecord
    belongs_to :category
    has_many :favorites
    has_many :users, through: :favorites
    has_many :comments

    def format_instructions
        instructions = self.instructions.split("\r\n")
        instructions.filter { |e| e != "" }
    end

    def format_youtube
        yt = self.youtube_url
        yt = yt.sub!("watch?v=", "embed/")
    end

    def format_comments
        commentArray = []
        comments = self.comments
        comments.each do |comment|
            comment_hash = {
                id: comment.id,
                content: comment.content,
                recipe: comment.recipe_id,
                username: comment.user.username
            }
            commentArray << comment_hash
        end 
        commentArray  
    end
    def self.search_name(term)
        recipes = Recipe.all.filter{ |recipe| recipe.name.downcase.include?(term.downcase)}
    end
end
