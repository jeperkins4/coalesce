require 'spec_helper'

describe Message do
  let(:message) { Fabricate(:message) }

  context 'delegation' do
    it "should delegate association" do
      message.identity_name.should be 
    end
    it "should delegate association" do
      message.project_name.should be 
    end
  end
end
