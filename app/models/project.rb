class Project < ActiveRecord::Base
  has_and_belongs_to_many :teams
  has_many :documents
  has_many :messages

  paginates_per 3

  validates :name, :hashtag, uniqueness: true
  accepts_nested_attributes_for :documents, :reject_if => :all_blank, :allow_destroy => true
end
