# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rails232_session',
  :secret      => '2279889202252738dc9ec2d893b2cbdafcb0b74953d34811cf1653dde43fb2af05a8938cd13adf45f264e26df040b33c7ba0ba5ba2aa87d8e03766595880de8e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
