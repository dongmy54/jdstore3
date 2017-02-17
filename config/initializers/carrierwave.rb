require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'
CarrierWave.configure do |config|
  if Rails.env.production? 
    config.storage :fog                       
    config.fog_credentials = {
      provider:              'AWS',                        
      aws_access_key_id:     "AKIAJD5U46EB5KCZYIVA" ,         

      aws_secret_access_key: "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" ,        

      region:                'us-west-2' # 你的S3 bucket 的 Region 位置    

    }
    config.fog_directory  = ENV["AWS_BUCKET_NAME"] 


  else
    config.storage :file
  end



end