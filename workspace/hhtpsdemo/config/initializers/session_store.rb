# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_hhtpsdemo_session',
  :secret      => '06cfc7bcf352fccd51a09bdf9c88cbc3782aa9c8efde853f3f70b7e7adb3ab3e41cfdc0eb0137eab66e7c05658e8bdd5eac3f68d6d058f583533470bfd9c4597'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
