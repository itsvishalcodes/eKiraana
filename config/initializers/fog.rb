require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
	config.storage :fog
	config.fog_provider = 'fog/aws'

	config.fog_credentials = {
		:provider				=> "AWS",
		:aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],
		:aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'],
		:region                 => 'us-east-2'
	}

	config.fog_directory	= ENV['AWS_BUCKET']
	config.fog_public 		= false
end