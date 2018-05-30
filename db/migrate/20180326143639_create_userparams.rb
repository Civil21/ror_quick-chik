class CreateUserparams < ActiveRecord::Migration[5.1]
  def change
    create_table :userparams do |t|
      t.integer :user_id
      t.string :name
      t.string :full_name
      t.datetime :dofb
      t.string :facebook_url
      t.string :country
      t.string :city
      t.string :adress

      t.integer :score,  null: false,  default: 0
      t.string :avatar

      t.timestamps
    end
  end
end
