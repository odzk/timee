class UsersController < ApplicationController
before_action :logged_in_user, only: [:purchase, :purchase2, :purchase3, :purchase4, :show, :index, :index2, :index3, :index4, :new3, :teacher]
before_action :not_logged_in_user, only: [:new , :create]
before_action :student_user, only: [:purchase, :purchase2, :purchase3, :purchase4 , :edit3, :edit4, :edit5, :edit6, :edit7]
before_action :teacher_now, only: [:show, :endenter ]
before_action :admin_user, only: [:index, :index2, :index3, :index4, :new3, :salary, :destroy ]
before_action :teacher_user, only: [:teacher, :edit2 ]
before_action :correct_user, only: [:edit ]
 protect_from_forgery except: :purchase

 def instaparams
  @access_token = params[:access_token]
  @user = User.where(:instagram_token => @access_token)

  if @user.blank?

  redirect_to 'https://www.instagram.com/oauth/authorize/?client_id=40121d95c810426f8138deb395cff7fc&redirect_uri=http://timee-online.com/insta&response_type=code'

  else

  @user.each do |u|
    @email = u.email
    @pass = u.instagram_id
  
  end

  redirect_to auto_sign_insta_path(email: @email, pass: @pass)

  end
 end 


 def login_insta

 end 


 def createinsta

  @code = params[:code]
  
  @options = {
    body: {
      client_id: '40121d95c810426f8138deb395cff7fc',
      client_secret: '9f4014e5160e4dae8abe31c497aa0851',
      grant_type: 'authorization_code',
      redirect_uri: 'http://timee-online.com/insta',
      code: @code
    }
  }

  @result = HTTParty.post("https://api.instagram.com/oauth/access_token", @options)
  @result_parsed = @result.parsed_response
  @token_array = []
  @result_parsed.each do |r|

    @token_array << r[1]

    unless r[1]['id'].blank?
    @id = r[1]['id']
    @dummy_email = @id + '@instagram.com'
    end

    unless r[1]['username'].blank?
    @username = r[1]['username']
    end
    
    unless r[1]['profile_picture'].blank?
    @profile_picture = r[1]['profile_picture']
    end

    unless r[1]['full_name'].blank?
    @full_name = r[1]['full_name']
    end
    
    unless r[1]['bio'].blank?
    @bio = r[1]['bio']
    end
    
    unless r[1]['website'].blank?
    @website = r[1]['website']
    end

  end

    unless @token_array[0].blank?
    @access_token = @token_array[0]
    end

  @user = User.new(name: @full_name, email: @dummy_email, password: @id, time: 30, type_user: "student", instagram_token: @access_token)
  @history = @user.history.build(transaction_name: "Free Trial 30 minutes", min_type: "+", mins: 30, datetime: DateTime.now, teacher: "N/A")
  
  if @bio.present?
    @user.update(instagram_bio: @bio)
  end

  if @website.present?
    @user.update(instagram_website: @website)
  end


  if @profile_picture.present?
    @user.update(instagram_profile_picture: @profile_picture)
  end

  if @user.save
  flash[:success] = "Success! Welcome to Timee!" 
  redirect_to auto_sign_insta_path(email: @dummy_email, pass: @pass)

  else
  flash[:danger] = @user.errors.full_messages
  end
 end

 def createfb
  @name = params[:name]
  @email = params[:email]
  @pass = params[:password]
  @gender = params[:gender]
  @age = params[:age]
  @user = User.new(name: @name, email: @email, password: @pass, time: 30, sex: @gender, fb_id: @pass, age: @age, type_user: "student")
  @history = @user.history.build(transaction_name: "Free Trial 30 minutes", min_type: "+", mins: 30, datetime: DateTime.now, teacher: "N/A")
  
  if @user.save
  flash[:success] = "Success! Welcome to Timee!" 
  redirect_to auto_sign_path(email: @email, pass: @pass)
  else
  flash[:danger] = "You're already Registered Using Facebook. Please sign in."
  redirect_to "/login"
  end
 end

  def history_class
    @user = params[:student]
    @student = User.where(:name => @user)
    @history_class = Safe.where(:student => @user)

  end

  def report_teacher

    @user = User.find(params[:id])
    @student = current_user.name
    @teacher = @user.name
    @report = @user.report_teacher.build(teacher_name: @teacher, student_name: @student, incident_name: "Not Answering Calls")
    @report.save
    flash[:danger] = "Teacher has been reported for not anwering the call! Thank you."
    redirect_to endenter_users_path(@user)

  end

  def status_online
    current_user.update(last_seen_at:DateTime.now)
    render :nothing => true
  end
 
 
  def purchase
    secret_key = Sk.find(1)
    sk = secret_key.sk
    Payjp.api_key = sk
    Payjp::Charge.create(currency: 'jpy', amount: 24980, card: params['payjp-token'])
    
      @user = User.find(current_user.id)
        @user.update(:addtime => 1800 )
        @add = @user.addtime + @user.time
        @user.update(:time => @add )

        @history = @user.history.build(transaction_name: "Purchase Time 30 hours", min_type: "+", mins: 1800, datetime: DateTime.now, teacher: "N/A")
        @history.save

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

        @history = @user.history.build(transaction_name: "Purchase Time 10 hours", min_type: "+", mins: 600, datetime: DateTime.now, teacher: "N/A")
        @history.save

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

        @history = @user.history.build(transaction_name: "Purchase Time 5 hours", min_type: "+", mins: 300, datetime: DateTime.now, teacher: "N/A")
        @history.save

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

        @history = @user.history.build(transaction_name: "Purchase Time 1 hour", min_type: "+", mins: 60, datetime: DateTime.now, teacher: "N/A")
        @history.save

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

    if params[:new]
        @referral_id = params[:user][:referral_id]
        @instagram = params[:user][:instagram]
        @user = User.new(user_params)
        @history = @user.history.build(transaction_name: "Free Trial 30 minutes", min_type: "+", mins: 30, datetime: DateTime.now, teacher: "N/A")
       
        #add reward to teacher who refer the student
        if @referral_id.present?
        @user_t = User.find_by(:referral_id =>@referral_id)
        reward = @user_t.time + 30
        @user_t.update(:time => reward)
        @user_t.history.build(transaction_name: "Student Reward Sign Up", min_type: "+", mins: 30, datetime: DateTime.now, teacher: @user.name)
        @user_t.save
        end

       if @user.save
          if @instagram.present?
          @user.update(:referral_id => @instagram)
          end
          flash[:success] = "成功！"
        redirect_to "/login"
       else
        flash[:error] = @user.errors.full_messages
         render 'new'
       end
   
    elsif params[:new2]
        ref_id = rand(36**8).to_s(36)
        @user = User.new(user_params)
        @user.update(:referral_id => ref_id)

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

  @time_record = @user.time_incentive.paginate(page: params[:page], :per_page => 10)

  # @time_in = @user.time_incentive.where("DATE(time_in) = ?", Date.today)
  # @time_out = @user.time_incentive.where("DATE(time_out) = ?", Date.today)

  @current = current_user.name
  @student_history = Safe.all
  @safes = Safe.where(:status_teacher => 'yet').where(:teacher => @current).paginate(page: params[:page])
  @totalsafes = Safe.where(:teacher => @current).paginate(page: params[:page])
  @student_name = Safe.where(:status_teacher => 'yet').where(:teacher => @current).paginate(page: params[:page]).last(1)
  @report = @user.report_teacher.last(3)
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
      else
        flash[:error] = @user.errors.full_messages
        redirect_to edit_user_path
      end
      
    elsif params[:skype_update]


      @user = User.find(params[:id])
      @user.update(user_params)
      flash[:success] = "Skype ID updated, you can now start a class!"
      redirect_to "/"

    elsif params[:busy]
      
      @user = User.find(params[:id])

    if params[:user][:busy] == "available"
      if @user.busy == "available" || @user.busy == "call"
        #Do nothing to avoid duplicates
       else

      @time_in = @user.time_incentive.build(teacher_name: @user.name, time_in: Time.now)
      @time_in.save

       end

    elsif params[:user][:busy] == "busy"
        if @user.busy == "busy" 
        # Do nothing to avoid duplicates
        else

        @time_out_status = TimeIncentive.order("created_at").last
        @time_out_status.update(time_out: Time.now)

        # auto conversion of time if 5:45PM ~ 5:59PM

        @time_in = @user.time_incentive
        @time_out = @user.time_incentive


        #@time_in = @user.time_incentive.where("DATE(time_in) = ?", Date.today).last(1)
        #@time_out = @user.time_incentive.where("DATE(time_out) = ?", Date.today).last(1)


  @time_in.each do |t|
    @t_in = t.time_in
  end

  # if @t_in.hour == 18 && @t_in.min >= 45
  # @t_in = Time.parse("19:00") # auto convert to Time incentive
  # end 

  @time_out.each do |t|
    @t_out = t.time_out
  end


  if @t_in.present? && @t_out.present? && @t_out > @t_in

    # if @t_out >= DateTime.now.midnight

    #   @t_out = Time.parse("24:00")

    # end

  @count_time = (@t_out - @t_in) / 1.minutes
  end

  if @count_time.present?

  @incentive_time = @count_time / 5


  if @t_in.hour >= 19 #incentive will be generated only during 6PM - 12midnight

  @earning = @user.time + @incentive_time #converting incentive time to timee time

  @earn = TimeIncentive.order("updated_at").last

  @earn.update(total_earn: @count_time)

  @user.update(:time => @earning)

  @history = @user.history.build(transaction_name: "Total Incentive Time Earned: " + @count_time.round(2).to_s + " mins", min_type: "+", mins: @incentive_time, datetime: DateTime.now, teacher: "N/A")
  @history.save
  end
 end

  end
      end

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
        @safe.update(:topic => params[:user][:topic])
        @safe.update(:notes => params[:user][:notes])
        # @user.update(:busy => "busy" )
        # flash[:success] = "申請しました！"
        redirect_to endenter_users_path(@user)
      end
      
    end
    
  end  
  
  
  def endenter
    
    @user = User.find(params[:id])
    @current_user = current_user

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
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin, :activated, :skype, :picture, :image, :addtime, :time, :busy, :movie, :country, :hobby, :appeal, :job, :skill, :sex, :type_user, :picture, :picture2, :picture3, :youtube_url, :nick, :name2, :display_name, :referral_id)
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
