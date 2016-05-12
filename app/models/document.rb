class Document < ActiveRecord::Base
  belongs_to :project
  mount_uploader :media, DocumentUploader
end
