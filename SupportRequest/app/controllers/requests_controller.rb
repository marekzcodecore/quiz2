class RequestsController < ApplicationController


	def new
		@request = Request.new	  
	end
	

	def create
	  request_params = params.require(:request).permit([:name, :email, :message, :department])
	  @request = Request.new request_params		
		if @request.save		
		  redirect_to request_path(@request)
		end
	end

	def show
	  @request = Request.find params[:id]   	
	end

	def index
	  @requests = Request.order(created_at: :desc)
	end

end
