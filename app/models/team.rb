class Team < ActiveRecord::Base
  has_and_belongs_to_many :projects, uniq: true
  has_and_belongs_to_many :users, uniq: true
end
