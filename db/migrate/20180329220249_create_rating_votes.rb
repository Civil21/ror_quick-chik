class CreateRatingVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :rating_votes do |t|
      t.integer :rating_id
      t.integer :user_id
      t.integer :score, null: false,  default: 0

      t.timestamps
    end
  end
end
