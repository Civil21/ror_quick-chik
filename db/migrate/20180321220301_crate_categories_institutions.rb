class CrateCategoriesInstitutions < ActiveRecord::Migration[5.1]
  def change
  	create_table :categories_institutions, id: false do |t|
  		t.integer :category_id
  		t.integer :institution_id
  	end
  end
end
