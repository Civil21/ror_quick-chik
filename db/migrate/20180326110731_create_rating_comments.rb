class CreateRatingComments < ActiveRecord::Migration[5.1]
  def change
    create_table :rating_comments do |t|
      t.integer :rating_id
      t.integer :user_id
      t.string :text

      t.timestamps
    end
  end
end
