module VisitorsHelper
  def project_image_link(document)
    content_tag(:img, nil, src: document.media.download_url(document.media), width: '700px', height: '300px', alt: document.name, class: 'img-responsive') unless document.media.blank?
  end
end
