class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :image_url
      t.integer :category_id
      t.string :region
      t.string :youtube_url
      t.string :tags
      t.string :ingredients, array: true, default: []
      t.string :measurements, array: true, default: []
    end
  end
end
