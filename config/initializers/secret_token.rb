# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

#SampleApp::Application.config.secret_key_base = '7aaf725e3e552268db821994f92f76d7ecbd718f2611c7f5c9b3dae0713bddcb5764bcc9650af4b63bd4a554ad2ee0c4b8c5206181e29e4392ee5c48b19df8e6'

require 'securerandom'

def secure_token
	token_file = Rails.root.join('.secret')
	if File.exist?(token_file)
		File.read(token_file).chomp
	else
		token = SecureRandom.hex(64)
		File.write(token_file,token)
		token
	end		
end

SampleApp::Application.config.secret_key_base = secure_token