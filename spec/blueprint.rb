require 'faker'

Sham.login  { Faker::Name.first_name + Faker::Name.last_name }
# Sham.email { Faker::Internet.email(Faker::Name.first_name) }

User.blueprint do
  login { Sham.login }
  email "no-reply@dontrush.org"
  # email { Sham.email }
  password "password"
  password_confirmation "password"
  active true
  # login_count 1
  # perishable_token
end

