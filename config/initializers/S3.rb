CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => "AKIAIELR25YGL2U6DVVA",
      :aws_secret_access_key  => "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",
      :region                 => 'us-east-1' # Change this for different AWS region. Default is 'us-east-1'
  }
  config.fog_directory  = "carosabikes-images"
end