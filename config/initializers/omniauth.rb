Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linkedin, ENV['consumer_key'], ENV['consumer_secret'], scope: 'r_basicprofile r_emailaddress'
  provider :venmo, ENV['client_id'], ENV['client_venmo_secret'], scope: 'access_profile,make_payments'
end
