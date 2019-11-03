# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@student1 = Student.create(first_name: "Admin", last_name: "student", email:"student1@attms.com", encrypted_password: "$2a$11$W6OdGdGAS74FvlDTNtnmSuz57AHcKtBwjRT0NfYsggAxvCklUrmmy")
@student2 = Student.create(first_name: "Admin", last_name: "student", email:"student2@attms.com", encrypted_password: "$2a$11$W6OdGdGAS74FvlDTNtnmSuz57AHcKtBwjRT0NfYsggAxvCklUrmmy")
@subject = Subject.create(subject_name: "Nonmed")
@course = Course.create(teacher_id: 1, student_id: 1, subject_id: @subject.id, classes: 0)
@attendance = Attendance.create(course_id: 2, student_id: 2, attended: 0)
@learning = Learning.create(course_id: 2, student_id: 1)
