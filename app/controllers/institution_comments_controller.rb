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
		render "institutions/show"
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

	def positiv_vote
    	@vote=InstitutionCommentVote.find_by(user_id: current_user.id,institution_comment_id: @institution_comment.id)
    	if @vote==nil && @institution_comment.user.id != current_user.id
      		@vote=InstitutionCommentVote.create(user_id: current_user.id,institution_comment_id: @institution_comment.id,score: 1)
      		@user =Userparam.find_by(user_id: @institution_comment.user.id)
      		@user.update(score: @user.score+1)
    	else
      		if @institution_comment.user.id != current_user.id && @vote.score==-1;
        		@vote.update(score: 1)
        	@user =Userparam.find_by(user_id: @institution_comment.user.id)
      		@user.update(score: @user.score+2)
      		end
    	end
    	redirect_to institution_path(@institution_comment.institution.id)
  	end

  	def negativ_vote
    	@vote=InstitutionCommentVote.find_by(user_id: current_user.id,institution_comment_id: @institution_comment.id)
    	if @vote==nil && @institution_comment.user.id != current_user.id
      		@vote=InstitutionCommentVote.create(user_id: current_user.id,institution_comment_id: @institution_comment.id,score: -1)
      		@user =Userparam.find_by(user_id: @institution_comment.user.id)
      		@user.update(score: @user.score-1)
    	else
      		if @institution_comment.user.id != current_user.id && @vote.score==1;
        		@vote.update(score: -1)
        		@user =Userparam.find_by(user_id: @institution_comment.user.id)
      			@user.update(score: @user.score-2)
      		end
    	end
    	redirect_to institution_path(@institution_comment.institution.id)
  	end

	private

	def institution_comment_params
		params.require(:institution_comment).permit(:user_id,:institution_id,:text)
	end

	def get_institution_comment
		@institution_comment=InstitutionComment.find(params[:id])
	end
end
