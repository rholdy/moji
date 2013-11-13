class HomeController < ApplicationController

  def show
  	@translate = Translate.find(params[:id])
  end

  def new
	@translate = Translate.new
	end

	def create
		@translate = Translate.new(params[:translate])
    
		if @translate.save
			redirect_to show_message_path(@translate), notice: "IT WORKED!"
		else
	      flash.now.alert = "Please correct the following: #{@translate.errors.full_messages.join(', ')}"
	      render :new
    end
	end

end
