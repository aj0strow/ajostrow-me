module ApplicationHelper
  
  def admin?
    current_user and current_user[:info][:nickname] == 'aj.ostrow'
  end
  
  def editor?
    editors = ['aj.ostrow']
    current_user and editors.include? current_user[:info][:nickname]
  end
  
  def markdown(text)
    options = [ :autolink, :filter_html, :safelink ]
    RDiscount.new(text, *options).to_html.html_safe
  end
  
end
