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
    options = [ :autolink, :safelink ]
    text = coderay(text)
    text = RDiscount.new(text, *options).to_html
    # RDiscount.new( coderay(text), *options).to_html.html_safe
    # text.gsub(/```([a-z]*)(.*?)```/m) do
    #   CodeRay.scan($2, $1).div( css: :class )
    # end
    return text.html_safe
  end
  
  def coderay(text)
    text.gsub(/```([a-z]*)(.*?)```/m) do
      lang = coderay_language( $1 )
      CodeRay.scan($2, lang).div
    end
  end
  
  private
  
    def coderay_language(language)
      unless language.blank?
        language.to_sym
      else
        :coderay
      end
    end
  
end
