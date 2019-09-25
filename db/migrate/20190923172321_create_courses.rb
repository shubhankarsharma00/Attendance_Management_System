class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
    	t.belongs_to :subject, foreign_key: true
    	t.belongs_to :teacher, foreign_key: true
    	t.integer :classes
    end
  end
end
