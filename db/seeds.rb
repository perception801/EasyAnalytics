require "faker"


user = User.first

10.times do
  RegisteredApplication.create!(
    user: user,
    name: Faker::Lorem.characters(6),
    url: Faker::Internet.url

    )
end

apps = RegisteredApplication.all


20.times do
  Event.create!(
    registered_application: apps.sample,
    name: Faker::Lorem.word
    )
end

puts "Seeds Complete"
puts "#{RegisteredApplication.count} applications created"
puts "#{Event.count} events created"