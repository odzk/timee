class UsersController < ApplicationController
before_action :logged_in_user, only: [:purchase, :purchase2, :purchase3, :purchase4, :show, :index, :index2, :index3, :index4, :new3, :teacher]
before_action :not_logged_in_user, only: [:new , :create]
before_action :student_user, only: [:purchase, :purchase2, :purchase3, :purchase4 , :edit3, :edit4, :edit5, :edit6, :edit7]
before_action :teacher_now, only: [:show, :endenter ]
before_action :admin_user, only: [:index, :index2, :index3, :index4, :new3, :salary, :destroy ]
before_action :teacher_user, only: [:teacher, :edit2 ]
before_action :correct_user, only: [:edit ]
 protect_from_forgery except: :purchase
 
 
  def purchase
    secret_key = Sk.find(1)
    sk = secret_key.sk
    Payjp.api_key = sk
    Payjp::Charge.create(currency: 'jpy', amount: 24980, card: params['payjp-token'])
    
      @user = User.find(current_user.id)
    
        @user.update(:addtime => 1800 )
        @add = @user.addtime + @user.time
        @user.update(:time => @add )
        flash[:success] = "購入完了しました"
        redirect_to edit3_user_path(current_user.id)

  end

  def purchase2
    secret_key = Sk.find(1)
    sk = secret_key.sk
    Payjp.api_key = sk
    Payjp::Charge.create(currency: 'jpy', amount: 8980, card: params['payjp-token'])
    
      @user = User.find(current_user.id)
    
        @user.update(:addtime => 600 )
        @add = @user.addtime + @user.time
        @user.update(:time => @add )
        flash[:success] = "購入完了しました"
        redirect_to edit3_user_path(current_user.id)

  end

  def purchase3
    secret_key = Sk.find(1)
    sk = secret_key.sk
    Payjp.api_key = sk
    Payjp::Charge.create(currency: 'jpy', amount: 4780, card: params['payjp-token'])
    
      @user = User.find(current_user.id)
    
        @user.update(:addtime => 300 )
        @add = @user.addtime + @user.time
        @user.update(:time => @add )
        flash[:success] = "購入完了しました"
        redirect_to edit3_user_path(current_user.id)

  end

  def purchase4
    secret_key = Sk.find(1)
    sk = secret_key.sk
    Payjp.api_key = sk
    Payjp::Charge.create(currency: 'jpy', amount: 980, card: params['payjp-token'])
    
      @user = User.find(current_user.id)
    
        @user.update(:addtime => 60 )
        @add = @user.addtime + @user.time
        @user.update(:time => @add )
        flash[:success] = "購入完了しました"
        redirect_to edit3_user_path(current_user.id)

  end

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
  @profile_pic = @user.profile_pic

  end
  
  
  def new
    @user = User.new
    @history = History.new
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

        # @photo1 = params[:user][:picture].original_filename
        # @photo2 = params[:user][:picture2].original_filename
        # @photo3 = params[:user][:picture3].original_filename
        # @youtube_video = params[:user][:youtube_url]
    
    if params[:new]
    
        @user = User.new(user_params)
        @history = @user.history.build(transaction_name: "Free Trial 30 minutes", min_type: "+", mins: 30, datetime: DateTime.now, teacher: "N/A")
       if @user.save
          flash[:success] = "成功！"
        redirect_to "/login"
       else
         render 'new'
       end
   
    elsif params[:new2]

        @user = User.new(user_params)
        #@profile = @user.profile_pic.build(photo1: @photo1, photo2: @photo2, photo3: @photo3, youtube_video: @youtube_video)

       if @user.save
          flash[:success] = "成功！"
        redirect_to "/login"
       else
         render 'new2'
       end
   
    elsif params[:new3]
    
        @user = User.new(user_params)
       if @user.save
          flash[:success] = "成功！"
        redirect_to "/user/index2"
       else
         render 'new3'
       end
   
    end
   
  end
  
  def edit
  @user = User.find(params[:id])
  end
  
  def edit2
  @user = User.find(current_user.id)
  @history = @user.history
  @current = current_user.name
  @safes = Safe.where(:status_teacher => 'yet').where(:teacher => @current).paginate(page: params[:page])
  @totalsafes = Safe.where(:teacher => @current).paginate(page: params[:page])
  end
  
  def edit3
    
  end
  
  def edit4

  secret_key = Sk.find(1)
  @pk = secret_key.pk
  
  end
  
  def edit5

  secret_key = Sk.find(1)
  @pk = secret_key.pk
  
  end
  
  def edit6

  secret_key = Sk.find(1)
  @pk = secret_key.pk
  
  end
  
  def edit7

  secret_key = Sk.find(1)
  @pk = secret_key.pk

  end

  
  def update
    
    if params[:edit]
      
      @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:success] = "成功！"
        redirect_to edit_user_path
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
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin, :activated, :skype, :picture, :image, :addtime, :time, :busy, :movie, :country, :hobby, :appeal, :job, :skill, :sex, :type_user, :picture, :picture2, :picture3, :youtube_url, :nick, :name2, :display_name)
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
