module ImageLinkHelper
  def image_link(path, method, image_name, image_options={}, link_options={})
    link_class = link_options[:class]
    link_id = link_options[:id]
    image_size = image_options[:size]
    image_alt_text = image_options[:alt]
    link_to path, method: method, class: link_class, id: link_id do
      ActionController::Base.helpers.image_tag image_name, alt: image_alt_text, size: image_size
    end.html_safe
  end
end
