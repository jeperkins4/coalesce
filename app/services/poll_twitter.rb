class PollTwitter
  attr_accessor :identity

  def initialize(identity)
    self.identity = identity
  end

  def run
    client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['TWITTER_APP_ID']
      config.consumer_secret = ENV['TWITTER_APP_SECRET']
      config.access_token = identity.accesstoken
      config.access_token_secret = identity.access_secret_token
    end

    Project.all.each do |project|
      client.search("#{project.hashtag} -rt").each do |tweet|
        message = Message.find_or_create_by(text: tweet.text, nickname: tweet.user.screen_name, provider: 'twitter', project_id: project.id)
        if identity.nickname == tweet.user.screen_name
          message.identity_id = identity.id
          message.save if message.changed?
        end
      end
    end
  end
end
