class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|

      t.timestamps
      t.integer :user_id
      t.integer :content_id
    end
  end
end
