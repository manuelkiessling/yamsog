# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Yamsog_SessionServer_session',
  :secret      => 'e13aaba42a75ee935981923b6f67ecd20d48b3fa7737bc58229f2a4344eae3b9684f9ccd1ee995abe655a4f8587b81fe6a3f4d70f8bdfce612c797b24ec875cf'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
