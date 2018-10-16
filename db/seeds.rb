User.destroy_all

Admin.create(
  name: 'John Doe',
  email: 'admin@example.com',
  password: '123456',
  phone: '123456789',
)

Mentor.create(
  name: 'Jane Doe',
  email: 'mentor@example.com',
  password: '123456', phone: '123456789'
)

# Dummy Data
10.times do
  Admin.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: '123456',
    phone: Faker::PhoneNumber.cell_phone,
  )
end

10.times do
  Mentor.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: '123456',
    phone: Faker::PhoneNumber.cell_phone,
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
Company.destroy_all
25.times do
  location = Location.create(
    address_line1: Faker::Address.street_address,
    address_line2: Faker::Address.secondary_address,
    city: Faker::Address.city,
    country: 'US',
    postal_code: Faker::Address.zip_code,
    state: Faker::Address.state_abbr,
  )
  company = Company.create(
    name: Faker::Company.name,
    logo: Faker::Company.logo,
    description: Faker::Company.buzzword,
    phone: Faker::PhoneNumber.cell_phone,
  )
  company.location = location
end

client = Client.create(
  name: 'Jeff Doe',
  email: 'client@example.com',
  password: '123456',
  phone: '123456789',
)

client.client_info.update_attributes(description: Faker::Pokemon.name, company: Company.first)

10.times do
  client = Client.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: '123456',
    phone: Faker::PhoneNumber.cell_phone,
  )
  client.client_info.update_attributes(description: Faker::Pokemon.name, company: Company.last)
end

Phase.find_by(company: Company.last).update(status: 'active')
