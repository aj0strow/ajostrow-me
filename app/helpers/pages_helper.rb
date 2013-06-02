module PagesHelper
  
  def active_if(options)
    if params.merge(options) == params
      'nav-active'
    end
  end
  
  def experience_section(options = {}, &block)
    @flag ||= false
    @flag = !@flag
    
    content = content_tag :div, class: 'content' do
      content_tag :div, &block
    end
    
    img = content_tag :div, class: 'image' do
      image_tag("experience/#{options[:image]}") + content_tag(:span, options[:caption])
    end
    
    section = content_tag :section, class: 'row experience-section' do
      @flag ? content + img : img + content
    end
  end
  
end
