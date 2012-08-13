module ApplicationHelper
  
  def admin?
    current_user and current_user[:info][:nickname] == 'aj.ostrow'
  end
  
  def editor?
    false
  end
  
  
end
