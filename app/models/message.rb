class Message < ActiveRecord::Base
  belongs_to :identity
  belongs_to :project
end
