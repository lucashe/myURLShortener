class UrlsController < ApplicationController

	include UrlsHelper

	def index
		@url = Url.new
		@urls = Url.paginate(page: params[:page], order: "updated_at DESC")
	end

	def show
		@url = Url.find_by_shortURL(params[:id])
		@visits = @url.visits.paginate(page: params[:page], order: "created_at DESC")

	end

	def create

		@url = Url.new(url_params)

		#Check if the same URL has been added before
		existingUrl = Url.find_by_longURL(@url.longURL)
		if !existingUrl.nil?
			flash[:success] = "URL exist already " 
			existingUrl.update_attribute(:updated_at, Time.now)
			redirect_to action: :index and return
		end

		if @url.save
	      #The short URL is derived from the id
	      @url.update_columns(shortURL: bijective_encode(@url.id))

	      flash[:success] = "URL added " + @url.shortURL
	      redirect_to action: :index

		else
			flash.now[:error] = 'invalid URL'
			@urls = Url.paginate(page: params[:page], order: "updated_at DESC")
			render 'index'
		end

	end

	def link
		curLink = Url.find_by_shortURL(params[:unique_key])
		curLink.visits.create(url_id: curLink.id, ip: get_ip_address, os: get_operating_system)

		urlDest = curLink.longURL
		redirect_to urlDest, status: 301 
	end

	private

	def url_params
		params.require(:url).permit(:longURL)
	end



end
