class PollSocialMedia
  attr_accessor :identity

  def initialize(identity)
    self.identity = identity
  end

  def run
    case identity.provider.downcase
    when 'twitter'
      PollTwitter.new(identity).run
    end
  end

  private

end
