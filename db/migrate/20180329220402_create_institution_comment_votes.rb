class CreateInstitutionCommentVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :institution_comment_votes do |t|
      t.integer :institution_comment_id
      t.integer :user_id
      t.integer :score, null: false,  default: 0

      t.timestamps
    end
  end
end
