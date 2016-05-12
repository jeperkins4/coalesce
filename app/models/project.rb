class Project < ActiveRecord::Base
  has_and_belongs_to_many :teams
  has_many :documents

  accepts_nested_attributes_for :documents, :reject_if => :all_blank, :allow_destroy => true
end
