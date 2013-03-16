# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.

Lines::Application.config.secret_token = ENV['SECRET_TOKEN'] || (Rails.env != "production" && '1d79ee2eb9e34bc96b7453b4332ce711a51e5dc7f94a2c695f78590e858c91b6e9c5f88a01efd9dec2102abd6cc75b068058b2e9a6f708fdbb7e023ffae613a9')
