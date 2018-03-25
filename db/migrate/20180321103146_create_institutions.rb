class CreateInstitutions < ActiveRecord::Migration[5.1]
  def change
    create_table :institutions do |t|
      t.string :name
      t.string :description
      t.string :address
      t.string :phoneNumber
      t.string :images


  	  t.float :kitchen,null: false, default: 0
      t.float :servise,null: false, default: 0
      t.float :cleannes,null: false, default: 0
      t.float :atmosphere,null: false, default: 0

      t.timestamps
    end
  end
end
