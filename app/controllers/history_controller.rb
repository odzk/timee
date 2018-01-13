class HistoryController < ApplicationController

	def index

	end

	def show
		@user = User.find(params[:id])
		@history = History.where(:user_id => params[:id])

	end

end