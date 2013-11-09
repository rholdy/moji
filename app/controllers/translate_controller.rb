class TranslateController < ApplicationController

	def new
	@translate = Translate.new
	end

	def create
		@translate = Translate.new(params[:translate])
		if @translate.save
			redirect_to show_message_path(@translate), notice: "IT WORKED!"
		else
	      flash.now.alert = "Please correct the errors below"
	      render :new
        end
	end


end
