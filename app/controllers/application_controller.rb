# module CurrentScope
#   thread_mattr_accessor :user_permissions
# end

class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  #デフォルト
  
  
    include SessionsHelper
    #applicationで設定することで、
    #SessionsHelperが全部のcontorollerで使える
    #current_user、logged_in?もここに。


  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
    store_location
    flash[:danger] = "Please log in."
    redirect_to login_url
    end
  end

  def not_logged_in_user
    if logged_in?
    redirect_to "/"
    end
  end



  def correct_user
    if logged_in?
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
    else
    redirect_to(root_url) 
    end
  end
    
  def teacher_user
    if logged_in?
    redirect_to(root_url) unless current_user.type_user == "teacher"
    else
    redirect_to(root_url) 
    end
  end


  def teacher_now
    if logged_in?
      @user = User.find(params[:id])
      
      if @user.type_user == "teacher"
        
        if @user.busy == "busy"
          redirect_to(root_url)
        else
          redirect_to(root_url) unless current_user.type_user == "student"
        end
       
      else
       redirect_to(root_url) 
      end
      
    else
    redirect_to(root_url) 
    end
  end
  
  
  def student_user
    if logged_in?
    redirect_to(root_url) unless current_user.type_user == "student"
    else
    redirect_to(root_url) 
    end
  end
    
  def admin_user
    if logged_in?
    redirect_to(root_url) unless current_user.admin?
    else
    redirect_to(root_url) 
    end
  end
  
  def super_admin


  end





end