Rails.application.config.middleware.use OmniAuth::Builder do
    if Rails.env.development? || Rails.env.test?
        client_id = Rails.application.credentials.github[:client_id]
        client_secret = Rails.application.credentials.github[:client_secret]
        provider :github, client_id, client_secret
    else
        provider :github, 
            Rails.application.credentials.github[:client_id]
            Rails.application.credentials.github[:client_secret]
    end
end