require 'spec_helper'

describe Document do
  let(:document) { Fabricate(:document) }

  context 'delegation' do
    it "should delegate association" do
      document.project_name.should be 
    end
  end
end
