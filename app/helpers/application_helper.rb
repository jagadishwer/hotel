module ApplicationHelper
  def admin_signed_in
    if session[:administrator].nil?&& session[:customer].nil?
     
      return false
    else
      return true
    end
  end


  def is_admin_home
    if current_page?(:action=>"admin_home")
      true
    else
      false
    end
  end
  
  
  def is_customer_home
    if current_page?(:action=>"customer_home")
      true
    else
      false
    end
  end
  def add_click
    $validate=true
  end
end
