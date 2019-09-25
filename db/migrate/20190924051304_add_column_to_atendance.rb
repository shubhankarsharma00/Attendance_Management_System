class AddColumnToAtendance < ActiveRecord::Migration[5.2]
  def change
    add_reference :attendances, :course, index: true
    add_foreign_key :attendances, :courses  
	end
end
