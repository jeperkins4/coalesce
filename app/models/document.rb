class Document < ActiveRecord::Base
  belongs_to :project
  mount_uploader :media, DocumentUploader

  validates :media, presence: true

  before_save :update_asset_attributes

  scope :images, -> { where(content_type: ['image/jpeg']) }
  scope :files, -> { where(content_type: ['application/pdf']) }

  private

  def update_asset_attributes
    if media.present? && media_changed?
      self.content_type = media.file.content_type
      self.file_size = media.file.size
    end
  end
end
