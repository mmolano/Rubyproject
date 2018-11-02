Utilisateur.create!(nom: "Mike",
  email: "miike.molano@gmail.com",
  password: "root1234",
  password_confirmation: "root1234",
  admin: true, 
  activated: true,
  activated_at: Time.zone.now)

30.times do |n|
nom = Faker::Name.name
email = "example-#{n + 1}@gmail.com"
password = "password"
Utilisateur.create!(nom: nom,
    email: email,
    password: password,
    password_confirmation: password,
    activated: true,
    activated_at: Time.zone.now)
end