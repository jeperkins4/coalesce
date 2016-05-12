CarrierWave.configure do |config|
  config.storage = :aws
  config.aws_bucket = ENV.fetch('S3_BUCKET_NAME')
  config.aws_acl
  config.aws_credentials = {
    access_key_id: ENV.fetch('AWS_ACCESS_KEY'),
    secret_access_key: ENV.fetch('AWS_ACCESS_SECRET'),
    region: ENV.fetch('AWS_REGION')
  }
end
