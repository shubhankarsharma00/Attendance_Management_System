class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
    	t.belongs_to :student, foreign_key: true
    	t.integer :attended
    end
  end
end
