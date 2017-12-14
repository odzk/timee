class StaticPagesController < ApplicationController
  before_action :logged_in_user
  helper_method :sort_column, :sort_direction

  def home
    @users = User.paginate(page: params[:page]).where(type_user: "teacher")
  end
  
end