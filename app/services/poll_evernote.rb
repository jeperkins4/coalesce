class PollEvernote
  attr_accessor :identity

  def initialize(identity)
    self.identity = identity
  end

  def run
    user_store_url = "#{ENV['EVERNOTE_URL']}/edam/user"
    config = {
      consumer_key: ENV['EVERNOTE_KEY'],
      consumer_secret: ENV['EVERNOTE_SECRET'],
      username: identity.accesstoken,
      password: identity.access_secret_token
    }

    #Project.all.each do |project|
    #end
  end
end
