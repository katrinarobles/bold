# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'
require 'faker'

Occurence.destroy_all
Course.destroy_all
User.destroy_all



puts 'Creating 10 teachers'
url = 'https://pixabay.com/api/?key=8552570-540dab6f18162a9471dc11307&q=face&image_type=photo&pretty=true'
images_serialized = open(url).read
images = JSON.parse(images_serialized)
count = 1
10.times do
  photo_url = images["hits"].map do |photo|
    photo["userImageURL"]
  end.sample
  user = User.new(
    email: "user#{count}@email.com",
    password: "123456",
    name: "#{Faker::Name.unique.name}",
    teacher: true,
    address: "#{Faker::Address.full_address}",
    telephone: "#{Faker::PhoneNumber.cell_phone}"
  )
  # user.photo.attach(io: photo_url, filename: "user#{count}.png", content_type: 'image/png')
  count += 1
  user.save
end
puts 'Finished!'


puts 'Creating 20 students'
url = 'https://pixabay.com/api/?key=8552570-540dab6f18162a9471dc11307&q=face&image_type=photo&pretty=true'
images_serialized = open(url).read
images = JSON.parse(images_serialized)
count = 1
10.times do
  photo_url = images["hits"].map do |photo|
    photo["userImageURL"]
  end.sample
  user = User.new(
    email: "user#{count}@email.com",
    password: "123456",
    name: "#{Faker::Name.unique.name}",
    teacher: false,
    address: "#{Faker::Address.full_address}",
    telephone: "#{Faker::PhoneNumber.cell_phone}"
  )
  # user.photo.attach(io: photo_url, filename: "user#{count}.png", content_type: 'image/png')
  count += 1
  user.save
end
puts 'Finished!'


puts 'Creating 4 courses for each teacher'
types = ["Vinyasa yoga", "Hatha yoga", "Iyengar yoga", "Kundalini yoga", "Ashtanga yoga", "Bikram yoga", "Yin yoga", "Restorative yoga"]
descriptions = ["Linking breath with movement.", "Yoga poses are performed more quickly and with added core exercises and upper body work.", "This practice is usually twelve basic postures or variations of the Asanas, with Sun Salutations and Savasana.", "This practice focuses on lengthening the connective tissues within the body", "A delicious way to relax and soothe frayed nerves"]
durations = [30, 45, 50, 60, 75, 90]
User.where(teacher: true).each do |teacher|
  4.times do
    course = Course.new(
      name: "#{types.sample}",
      description: "#{descriptions.sample}",
      duration: durations.sample,
      price: (10..20).to_a.sample,
      location: "#{Faker::Address.full_address}",
    )
    course.user = teacher
    course.save
  end
end
puts 'Finished!'


puts 'Creating 3 occurences for each course'
times = ["7:00", "9:00", "11:00", "16:00", "18:00", "20:00"]
Course.all.each do |course|
  3.times do
    occurence = Occurence.new(
      date: "#{Faker::Date.forward(days: 4)}",
      time: "#{times.sample}"
    )
    occurence.course = course
    occurence.save
  end
end
puts 'Finished!'













