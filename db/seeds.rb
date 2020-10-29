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


Booking.destroy_all
Occurence.destroy_all
Course.destroy_all
User.destroy_all




# url = 'https://pixabay.com/api/?key=8552570-540dab6f18162a9471dc11307&q=face&image_type=photo&pretty=true'
# images_serialized = open(url).read
# images = JSON.parse(images_serialized)

url = 'https://source.unsplash.com/500x500/?face'
addresses = ['Via Solferino, 34, 20121 Milano MI', 'Largo la Foppa, 5, 20121 Milano MI', 'Galleria del Corso, 4, 20122 Milano MI', 'Via S. Maurilio, 20, 20123 Milano MI', 'Via Palestro, 16, 20121 Milano MI', 'Via Fatebenefratelli, 2, 20121 Milano MI', 'Via dei Fabbri, 1, 20123 Milano MI', 'Via San Vittore, 2, 20123 Milano MI', 'Via Archimede, 14, 20129 Milano MI', 'Via Conchetta, 8, 20136 Milano MI', 'Alzaia Naviglio Pavese, 78/3, 20142 Milano MI', 'Via Tortona, 56, 20144 Milano MI', 'Via Lazzaro Spallanzani, 16, 20129 Milano MI', 'Via Clerici, 5, 20121 Milano MI', 'Via Tivoli, 3, 20121 Milano MI']


puts 'Creating 10 teachers'
t_count = 1
10.times do
  # photo_url = images["hits"].map do |photo|
  #   photo["userImageURL"]
  # end.sample
  file = URI.open(url)
  user = User.new(
    email: "teacher#{t_count}@email.com",
    password: "123456",
    name: "#{Faker::Name.unique.name}",
    teacher: true,
    address: "#{addresses.sample}",
    telephone: "#{Faker::PhoneNumber.cell_phone}"
  )
  user.photo.attach(io: file, filename: "teacher#{t_count}.png", content_type: 'image/png')
  t_count += 1
  user.save
end
puts 'Finished!'


puts 'Creating 20 students'
s_count = 1
10.times do
  # photo_url = images["hits"].map do |photo|
  #   photo["userImageURL"]
  # end.sample
  file = URI.open(url)
  user = User.new(
    email: "student#{s_count}@email.com",
    password: "123456",
    name: "#{Faker::Name.unique.name}",
    teacher: false,
    address: "#{addresses.sample}",
    telephone: "#{Faker::PhoneNumber.cell_phone}"
  )
  user.photo.attach(io: file, filename: "student#{s_count}.png", content_type: 'image/png')
  s_count += 1
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
      # Lily
      # location: "#{Faker::Address.full_address}",
      location: "#{addresses.sample}",
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
      date: "#{Faker::Time.forward(days: 6,  period: :day)}",
      capacity: (10..20).to_a.sample
    )
    occurence.course = course
    occurence.save
  end
end
puts 'Finished!'


puts 'Creating 1 booking for each student'
User.where(teacher: false).each do |student|
  booking = Booking.new
    booking.user = student
    booking.occurence = Occurence.all.sample
    booking.save
end
puts 'Finished!'











