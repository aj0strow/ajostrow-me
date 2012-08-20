module ThoughtsHelper
  include ActsAsTaggableOn::TagsHelper
  
  def get_facebook_info(id)
    @facebook_data[id] ||= HTTParty.get("https://graph.facebook.com/#{ id }?fields=name,picture")
    @facebook_data[id]
  end
  
  def facebook_image_path(id)
    @facebook_data[id]["picture"]
  end
  
  def facebook_name(id)
    @facebook_data[id]["name"]
  end
  
end