class AddScoreToUserparam < ActiveRecord::Migration[5.1]
  def change
    add_column :userparams, :score, :integer, null: false,  default: 0
  end
end
