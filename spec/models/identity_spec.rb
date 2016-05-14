require 'spec_helper'

describe Identity do
  let(:identity) { Fabricate(:identity) }

  context 'delegation' do
    it "should delegate association" do
      identity.user_name.should be 
    end
  end
end
