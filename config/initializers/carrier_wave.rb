if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws' #←ここを追記
    config.fog_credentials = {
      # Amazon S3用の設定
      :provider              => 'AWS',
      :region                => ENV['S3_REGION'],     # 例: 'ap-northeast-1'
      :aws_access_key_id     => ENV['AWS_ACCESS_KEY_ID'],
      :aws_secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    }
    config.fog_directory     =  ENV['S3_BUCKET']
    config.asset_host = 'https://thr-app.s3.amazonaws.com' #このように修正
  end
end