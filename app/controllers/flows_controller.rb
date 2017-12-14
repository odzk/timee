class FlowsController < ApplicationController
  before_action :logged_in_user
  before_action :admin_user
  
  
def index
    @flows = Flow.paginate(page: params[:page]) 
end
def own
    @flows = Flow.paginate(page: params[:page]) 

end


def new
    @flow = Flow.new
end

def create
    @flow = Flow.new(flow_params)
     if @flow.save
         
       @user = User.where(:id => @flow.before_price )
       
       @flow.update(:price => @user[0].time )
       @flow.update(:staff => current_user.name )
       
       @user[0].update(:time => 0 )
       
       flash[:success] = "完了 Done"
       redirect_to salary_user_path
     else
       @flow = []
       flash[:danger] = "未入力項目があります。 Something wrong"
       redirect_to salary_user_path
     end
end







  private
  
  
   # def correct_user
   #   @sell = current_user.sells.find_by(id:params[:id])
   #   redirect_to root_url if @sell.nil?
   # end
 

   def flow_params
      params.require(:flow).permit(:content, :before_price, :year_date, :month_date, :day_date, :price, :after_price, :staff, :memo, :pass_company, :recieve_company, :company)
   end
  
  # def money_update
    
  # end



  
  
end
