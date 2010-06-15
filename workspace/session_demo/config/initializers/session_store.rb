# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_session_demo_session',
  :secret      => '8572fc84cf1855d49b98eb6f69a0a7aea4a5e18574b26ee138666bbea794a11c47ecbbbfd510f784e91d6ce5dbe5edf91290a376b29cbde9251ee607fc8316f0'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
 ActionController::Base.session_store = :active_record_store
