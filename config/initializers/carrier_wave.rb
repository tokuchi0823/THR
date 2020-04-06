if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws' #←ここを追記
    config.fog_credentials = {
      # Amazon S3用の設定
      :provider              => 'AWS',
      :region                => ENV['S3_REGION'],     # 例: 'ap-northeast-1'
   #   :aws_access_key_id     => ENV['S3_ACCESS_KEY'],
    #  :aws_secret_access_key => ENV['S3_SECRET_KEY']
       :aws_access_key_id => Rails.application.credentials.aws[:access_key_id],
       :aws_secret_access_key => Rails.application.credentials.aws[:secret_access_key]
    }
    config.fog_directory     =  ENV['S3_BUCKET']
    config.asset_host = 'https://thr-app.s3.amazonaws.com' #このように修正
  end
end