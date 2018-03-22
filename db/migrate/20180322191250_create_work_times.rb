class CreateWorkTimes < ActiveRecord::Migration[5.1]
  def change
    create_table :work_times do |t|
      t.integer :institution_id

      t.boolean :mondayWork
      t.string :mondayStart
      t.string :mondayEnd

      t.boolean :tuesdayWork
      t.string :tuesdayStart
      t.string :tuesdayEnd

      t.boolean :wednesdayWork
      t.string :wednesdayStart
      t.string :wednesdayEnd

      t.boolean :thursdayWork
      t.string :thursdayStart
      t.string :thursdayEnd

      t.boolean :fridayWork
      t.string :fridayStart
      t.string :fridayEnd

      t.boolean :saturdayWork
      t.string :saturdayStart
      t.string :saturdayEnd

      t.boolean :sundayWork
      t.string :sundayStart
      t.string :sundayEnd

      t.timestamps
    end
  end
end
