User.blueprint do
  login "exampleUser"
  email "exampleUser@example.com"
  password "password"
  password_confirmation "password"
  login_count 1
  active true
  # perishable_token
end

