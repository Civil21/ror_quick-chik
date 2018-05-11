class InstitutionCommentsController < ApplicationController
	before_action :authenticate_user!
	before_action :get_institution_comment, except:[:create]

	def create
		params[:institution_comment][:institution_id]=params[:institution_id]
		params[:institution_comment][:user_id]=current_user.id
		pp @comment=InstitutionComment.create(institution_comment_params)
		if @comment.save
		  redirect_to institution_path(params[:institution_id])
		else
      @comment.errors.full_messages.each do |msg|  
        @msg = msg
      end  
      flash[:notice] = "#{@msg}"
      redirect_to institution_path(params[:institution_id])
    end
	end

	def update
		@institution_comment.update(institution_comment_params)
		redirect_to institution_path(params[:institution_id])
	end

	def destroy
		@institution_comment.destroy
		redirect_to institution_path(params[:institution_id])
	end

	private

	def institution_comment_params
		params.require(:institution_comment).permit(:user_id,:institution_id,:text)
	end

	def get_institution_comment
		@institution_comment=InstitutionComment.find(params[:id])
	end
end
