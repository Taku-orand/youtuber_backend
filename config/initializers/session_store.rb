if Rails.env === 'production'
    Rails.application.config.session_store :cookie_store, key: '_youtuber_backend', domain: 'https://youtuber-app.herokuapp.com'
else
    Rails.application.config.session_store :cookie_store, key: '_youtuber_backend'
end