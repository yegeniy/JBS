# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_couponcoup_session',
  :secret      => '369becd57a8998dfb96c4f9ab47a9dc470c1037d98dae072449165300cee3a368d5b1dc76062106f5ccca08323217a29d7d644dcd872e813249d8dbcc7b68391'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
