class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
    	t.string :subject_name, unique: true
    end
  end
end
