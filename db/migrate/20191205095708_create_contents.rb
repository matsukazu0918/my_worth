class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|

      t.timestamps
      t.integer :user_id
      t.string :title
      t.text :body
    end
  end
end
