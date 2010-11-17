# Be sure to restart your server when you modify this file.

#ChizuMemo::Application.config.session_store :cookie_store, :key => '_chizu_memo_session'

ChizuMemo::Application.config.session_store :active_record_store, :cookie_only => false

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ChizuMemo::Application.config.session_store :active_record_store
