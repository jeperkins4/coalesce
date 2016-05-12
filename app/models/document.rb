class Document < ActiveRecord::Base
  belongs_to :project
  mount_uploader :media, DocumentUploader

  validates :media, presence: true
end
