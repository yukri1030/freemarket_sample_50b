require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  case Rails.env
  when 'production'
  config.storage = :fog
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: Rails.application.credentials.aws[:access_key_id],
    aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key],
    region: 'ap-northeast-1'
  }
<<<<<<< Updated upstream

=======
  
>>>>>>> Stashed changes
    config.fog_directory  = 'freemarket-sample-50b'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/freemarket-sample-50b'
  end
end