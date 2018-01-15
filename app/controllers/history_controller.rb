class HistoryController < ApplicationController

	def index

	end

	def show
		@user = User.find(params[:id])
		@history = History.where(:user_id => params[:id])

	end

	def contact_params
      params.require(:contact_us).permit(:name, :email, :subject, :message)
  	end

end