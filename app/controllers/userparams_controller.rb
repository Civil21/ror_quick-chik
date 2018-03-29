class UserparamsController < ApplicationController
	before_action :authenticate_user!
	before_action :get_userparam

	def show
		
	end

	def edit

	end

	def update
		@userparam.update(userparam_params)
		redirect_to userparam_path(@userparam.id)
	end

	def destroy
		@userparam.destroy
		redirect_to root_path
	end

	private 

	def userparam_params
		params.require(:userparam).permit(:user_id,:name, :full_name, :country,:city,:adress,:facebook_url,:dofb)
	end

	def get_userparam
		@userparam=Userparam.find(params[:id]) 
		if current_user.id == @userparam.user.id
		else
	 	@userparam = nil
	 	redirect_to root_path
		end
	end
end
