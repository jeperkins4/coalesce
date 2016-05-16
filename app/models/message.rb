class Message < ActiveRecord::Base
  belongs_to :identity
  belongs_to :project

  delegate :name, to: :project, prefix: true, allow_nil: true
  delegate :name, to: :identity, prefix: true, allow_nil: true
end
