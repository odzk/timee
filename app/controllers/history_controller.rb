class HistoryController < ApplicationController



	def index
		@user = User.all
		@history = @user.history.all

	end


end
