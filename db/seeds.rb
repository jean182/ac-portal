# Default Users
admin = Admin.create
User.create(name: 'John Doe', email: 'admin@example.com', password: '123456', phone: '123456789', title: 'Admin', account: admin)
mentor = Mentor.create
User.create(name: 'Jane Doe', email: 'mentor@example.com', password: '123456', phone: '123456789', title: 'Mentor', account: mentor)
client = Client.create
User.create(name: 'Jeff Doe', email: 'client@example.com', password: '123456', phone: '123456789', title: 'Client', account: client)

# Dummy Data
10.times do
  admin = Admin.create
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: '123456',
    phone: Faker::PhoneNumber.cell_phone,
    title: 'Admin',
    account: admin,
  )
end

10.times do
  mentor = Mentor.create(is_active: true)
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: '123456',
    phone: Faker::PhoneNumber.cell_phone,
    title: 'Mentor',
    account: mentor,
  )
end

10.times do
  client = Client.create(description: Faker::Pokemon.name)
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: '123456',
    phone: Faker::PhoneNumber.cell_phone,
    title: 'Client',
    account: client,
  )
end

20.times do
  Tag.create(
    name: Faker::Job.field,
    tag_type: 'industry',
  )
  Tag.create(
    name: Faker::Job.key_skill,
    tag_type: 'expertise',
  )
end

25.times do
  location = Location.create(
    address_line1: Faker::Address.street_address,
    address_line2: Faker::Address.secondary_address,
    city: Faker::Address.city,
    country: 'United States',
    postal_code: Faker::Address.zip_code,
    state: Faker::Address.state,
  )
  company = Company.create(
    name: Faker::Company.name,
    logo: Faker::Company.logo,
    description: Faker::Company.buzzword,
    phone: Faker::PhoneNumber.cell_phone,
  )
  company.location = location
end
