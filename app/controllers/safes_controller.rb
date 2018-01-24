class SafesController < ApplicationController
before_action :logged_in_user
before_action :admin_user, only: [:index, :edit2, :destroy]
before_action :teacher_user, only: [:edit ]
  
  helper_method :sort_column, :sort_direction
  
def index
     @safes = Safe.paginate(page: params[:page])
end



def edit
    @safe = Safe.find(params[:id])

end


def edit2
    @safe = Safe.find(params[:id])

end

def update

@safe = Safe.find(params[:id])

  if params[:edit]

                if @safe.update(safe_params)
                  flash[:success] = "編集完了"
                  redirect_back_or root_url
                else
                  flash[:danger] = "権限がないか、既に完了したアクションです。"
                  redirect_back_or root_url
                end

  elsif params[:application]
          
                if @safe.update(safe_params)
                  @teacher = User.find(current_user)
                  @teacher_id = @teacher.id
                  @studentname = @safe.student
                  @studentid = User.where(:name => @studentname)
                  @student = User.find(@studentid[0].id)

                  if @teacher.time.blank?
                    @teachertime = 0
                  else
                    @teachertime = @teacher.time
                  end
                  @add = @teachertime + @safe.time
                  @teacher.update(:time => @add )
                  @teacher_history = @teacher.history.build(transaction_name: "Student Class", min_type: "+", mins: 30, datetime: DateTime.now, teacher: @student.name)
                  @teacher_history.save

                  if @student.time.blank?
                    @studenttime = 0
                  else
                    @studenttime = @student.time
                  end
                  @add2 = @studenttime - @safe.time
                  @student.update(:time => @add2 )
                  @student_history = @student.history.build(transaction_name: "Class", min_type: "-", mins: 30, datetime: DateTime.now, teacher: @teacher.name)
                  @student_history.save
                  
                  flash[:success] = "Thank you for teaching!"
                  redirect_to edit2_user_path
                else
                  flash[:danger] = "Something is wrong. Please inform the administrator right away!"
                  redirect_back_or root_url
                end
                
  end

end  


  
  def destroy
    @safe = Safe.find(params[:id])
    @safe.destroy
      redirect_back_or root_url
  end


  private
  
   
  def read_shift_jis_encoded_params
    params_shift_jis = URI.decode_www_form(request.body.read, Encoding::Shift_JIS)
    params_shift_jis.each_with_object({}) do |(key, value), result|
      result[key.to_sym] = value.encode(Encoding::UTF_8, invalid: :replace, undef: :replace)
    end
  ensure
    request.body.rewind
  end
   
   
   
  def safe_params
    params.require(:safe).permit(:hontai, :name, :staff, :staff2, :type_machine, :number, :number_of_frame, :number_slot, :number_of_foundation, :status, :from, :to, :machine, :price_from, :remarks, :photo, :place, :maker, :year_of_manufacture, :month_of_manufacture, :color_of_panel, :date_of_removal, :date_of_verification, :date_of_out, :paper1, :paper2, :paper3, :photo2, :photo3, :easy_date_of_input,:easy_date_of_output,:price_after,:benefit, :time, :status_teacher)
  end


  # def safe_params2
  #   params.require(:safe).permit(:archive, :status)
  # end
  
  
  def sort_column
      Safe.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "desc"
  end
  

  def product_params
    params
      .require(:form_product)
      .permit(Safe::REGISTRABLE_ATTRIBUTES)
  end
  
  

end