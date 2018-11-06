User.destroy_all

Admin.create(
  name: 'John Doe',
  email: 'admin@example.com',
  password: '123456',
  phone: '123456789',
)

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

4.times do |i|
  Phase.where(phase_number: i + 1).first_or_create()
end
