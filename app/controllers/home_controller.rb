class HomeController < ApplicationController
  def index
  	@translate = Translate.new
  end

  def show
  	@translate = Translate.find(params[:id])
  end
  def translate
  	@translate = Translate.new
  end

end
