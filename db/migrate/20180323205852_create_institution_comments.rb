class CreateInstitutionComments < ActiveRecord::Migration[5.1]
  def change
    create_table :institution_comments do |t|
      t.integer :user_id
      t.integer :institution_id
      t.string :text

      t.timestamps
    end
  end
end
