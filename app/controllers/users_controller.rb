class UsersController < ApplicationController
# before_action :admin_user
 


  def index
    @users = User.paginate(page: params[:page]) 
  end
  def index2
    @users = User.paginate(page: params[:page]).where("type_user = 'teacher'")
  end
  def index3
    @users = User.paginate(page: params[:page]) .where("type_user = 'student'")
  end
  def index4
    @users = User.paginate(page: params[:page]) .where("type_user = 'not-yet-teacher'")
  end
  
  def teacher
    @users = User.paginate(page: params[:page]) 
  end
  
  def show
  @user = User.find(params[:id])

  end
  
  
  def new
    @user = User.new
  end
   
  def new2
    @user = User.new
  end 
  def new3
    @user = User.new
  end 
  
  def salary
    @users = User.paginate(page: params[:page]).where("type_user = 'teacher'")
    @salary = Flow.new
    
  end 
  
  

  def create
    @user = User.new(user_params)
   if @user.save
      flash[:success] = "成功！"
    redirect_to "/login"
   else
     render 'new'
   end
  end
  
  
  
  
  def edit
  @user = User.find(params[:id])
  end
  
  def edit2
  @user = User.find(current_user.id)
  @current = current_user.name
  @safes = Safe.where(:status_teacher => 'yet').where(:teacher => @current).paginate(page: params[:page])
  @totalsafes = Safe.where(:teacher => @current).paginate(page: params[:page])
  end
  
  def edit3
  @user = User.find(params[:id])
     
  end
  
  
  def pay
    Payjp.api_key = 'sk_test_510d69fe44f5b66ad674eccc'
    charge = Payjp::Charge.create(
    :amount => 3500,
    :card => params['payjp-token'],
    :currency => 'jpy',)
  end
  
  def update
    
    if params[:edit]
      
      @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:success] = "成功！"
        redirect_to users_path
      end
      
      
    elsif params[:time]
      
      @user = User.find(params[:id])
      if @user.update(user_params)
        @add = @user.addtime + @user.time
        @user.update(:time => @add )
        flash[:success] = "購入完了しました"
        redirect_to "/"
      end
      
      
    elsif params[:busy]
      
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to edit2_user_path
      end
      
    else
      
      @user = User.find(params[:id])
      
      if @user.update(user_params)
        @safe = Safe.new
        @safe.update(:student => current_user.name )
        @safe.update(:teacher => @user.name )
        @safe.update(:status_teacher => "yet" )
        # @user.update(:busy => "busy" )
        # flash[:success] = "申請しました！"
        redirect_to endenter_users_path(@user)
      end
      
    end
    
  end  
  
  
  def endenter
    
    @user = User.find(params[:id])

  end  

  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
      redirect_to users_path
  end
  
  

  private
  
  
    
  def sort_column
      Safe.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "desc"
  end
  
  
  
  
  def read_shift_jis_encoded_params
    params_shift_jis = URI.decode_www_form(request.body.read, Encoding::Shift_JIS)
    params_shift_jis.each_with_object({}) do |(key, value), result|
      result[key.to_sym] = value.encode(Encoding::UTF_8, invalid: :replace, undef: :replace)
    end
  ensure
    request.body.rewind
  end
  

  def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin, :activated, :skype, :picture, :image, :addtime, :time, :busy, :movie, :country, :hobby, :appeal, :job, :skill, :sex, :type_user)
  end
  
  def pay_params
      params.permit('payjp-token')
  end
  
  def safe_params
    params.require(:safe).permit(:status_teacher, :teacher, :student, :time)
    
  end
  
  
  def logged_in_user
     unless logged_in?
     
       store_location
 
       
       flash[:danger] = "ログインしてください"
       
       redirect_to login_url

     end
  end
    #アクセス権限可能性①
  
  
  # Confirms the correct user.
  def correct_user
    
    if current_user.admin.nil?
      
     @user = User.find(params[:id])
     #redirect_to(root_url) unless @user == current_user
     redirect_to(root_url) unless current_user?(@user)

    end
    
  end
    #アクセス権限可能性②
  
 def super_admin

   @user = User.find(params[:id])
   if @user.admin == "1"
    flash[:danger] = "working"
   end
 end

end