module ApplicationHelper
  
  def admin?
    current_user and current_user[:info][:nickname] == 'aj.ostrow'
  end
  
  def editor?
    editors = ['aj.ostrow']
    current_user and editors.include? current_user[:info][:nickname]
  end
  
  def admins_only
    unless admin?
      flash[:warning] = "You must be signed in as an administrator."
      redirect_to root_path
    end
  end
  
  def editors_only
    unless editor?
      flash[:warning] = "You must have editor privileges to do that."
      redirect_to root_path
    end
  end
  
  def markdown(text)
    options = [ :autolink, :filter_html, :safelink ]
    RDiscount.new(text, *options).to_html.html_safe
  end
  
end
