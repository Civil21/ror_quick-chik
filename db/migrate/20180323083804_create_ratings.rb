class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.integer :institution_id
      t.integer :user_id
      t.integer :kitchen,null: false, default: 1
      t.integer :servise,null: false, default: 1
      t.integer :cleannes,null: false, default: 1
      t.integer :atmosphere,null: false, default: 1

      t.timestamps
    end
  end
end
