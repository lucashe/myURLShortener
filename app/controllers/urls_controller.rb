class UrlsController < ApplicationController

	def index
		@url = Url.new
		@urls = Url.paginate(page: params[:page])
	end

	def show

	end

	def create
		@url = Url.new(url_params)

		urlCode = '2'

		@url.shortURL = urlCode

	    if @url.save
	      flash[:success] = "URL added"
	      redirect_to action: :index

	    else
	       flash.now[:error] = 'invalid URL'
	       @urls = Url.all
	       render 'index'
	    end

	end

	private
  
    def url_params
      params.require(:url).permit(:longURL)
    end

end
