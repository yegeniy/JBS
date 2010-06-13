# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_couponcoup_session',
  :secret      => 'd7c58cf459663a5e7e69df06cf8ec96db4d79c42ec0cc605da33c6a97f4ad31d545651f7eb3cae0cedda235ede4119c3e6216dba86e7051ee664d61de7321619'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
