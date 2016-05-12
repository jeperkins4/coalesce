module ApplicationHelper
  def project_image_link(document)
    content_tag(:img, nil, src: document.media.download_url(document.media), width: '700px', height: '300px', alt: document.name, class: 'img-responsive') unless document.try(:media).blank?
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def protocol
    Rails.env == 'production' ? 'https' : 'http'
  end
end
