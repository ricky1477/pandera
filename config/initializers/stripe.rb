if(Rails.env == 'development' || Rails.env == 'staging' || Rails.env == 'test')
	Rails.configuration.stripe = {
						:publishable_key => ENV['STRIPE_TEST_PUBLISHABLE_KEY'],
						:secret_key      => ENV['STRIPE_TEST_SECRET_KEY']
	}
elsif(Rails.env == 'production')
	Rails.configuration.stripe = {
						:publishable_key => ENV['STRIPE_LIVE_PUBLISHABLE_KEY'],
						:secret_key      => ENV['STRIPE_LIVE_SECRET_KEY']
	}
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]