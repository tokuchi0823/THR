# coding: utf-8

User.create!(name: "Sample User",
             email: "sample@example.com",
             password: "password",
             password_confirmation: "password",
             admin: true,
             displacement: 400,
             employee_number: "1",
             uid: "1")
             
User.create!(name: "superior1",
             email: "superior1@example.com",
             password: "password",
             password_confirmation: "password",
             superior: true,
             displacement: 400,
             employee_number: "1",
             uid: "1")
             
User.create!(name: "superior2",
             email: "superior2@example.com",
             password: "password",
             password_confirmation: "password",
             superior: true,
             displacement: 50,
             employee_number: "1",
             uid: "1")

60.times do |n|
  name  = Faker::Name.name
  email = "sample-#{n+1}@example.com"
  password = "password"
  employee_number = "#{n+1}"
  uid = "#{n+1}"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               displacement: 400,
               employee_number: employee_number,
               uid: uid)
end