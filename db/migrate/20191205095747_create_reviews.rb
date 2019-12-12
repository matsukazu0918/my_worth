class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|

      t.timestamps
      t.integer :user_id
      t.integer :content_id
      t.text :review_body
    end
  end
end
