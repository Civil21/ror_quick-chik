class RatingCommentsController < ApplicationController
	before_action :authenticate_user!
	before_action :get_rating_comment, except:[:create]

	def create
		params[:rating_comment][:rating_id]=params[:rating_id]
		params[:rating_comment][:user_id]=current_user.id
		pp @comment=RatingComment.create(rating_comment_params)
		if @comment.save
		redirect_to institution_path(Rating.find(params[:rating_id]).institution.id)
		else
		render "institutions/show"
		end
	end

	def update
		@rating_comment.update(rating_comment_params)
		redirect_to institution_path(@rating_comment.rating.institutions.id)
	end

	def destroy
		@rating_comment.destroy
		redirect_to institution_path(params[:rating_id])
	end

	def positiv_vote
    	@vote=RatingCommentVote.find_by(user_id: current_user.id,rating_comment_id: @rating_comment.id)
    	if @vote==nil && @rating_comment.user.id != current_user.id
      		@vote=RatingCommentVote.create(user_id: current_user.id,rating_comment_id: @rating_comment.id,score: 1)
      		@user =Userparam.find_by(user_id: @rating_comment.user.id)
      		@user.update(score: @user.score+1)
    	else
      		if @rating_comment.user.id != current_user.id && @vote.score==-1;
        		@vote.update(score: 1)
        		@user =Userparam.find_by(user_id: @rating_comment.user.id)
      			@user.update(score: @user.score+2)
      		end
    	end
    	redirect_to institution_path(@rating_comment.rating.institution.id)
  	end

  	def negativ_vote
    	@vote=RatingCommentVote.find_by(user_id: current_user.id,rating_comment_id: @rating_comment.id)
    	if @vote==nil && @rating_comment.user.id != current_user.id
      		@vote=RatingCommentVote.create(user_id: current_user.id,rating_comment_id: @rating_comment.id,score: -1)
      		@user =Userparam.find_by(user_id: @rating_comment.user.id)
      		@user.update(score: @user.score-1)
    	else
      		if @rating_comment.user.id != current_user.id && @vote.score==1;
        		@vote.update(score: -1)
        		@user =Userparam.find_by(user_id: @rating_comment.user.id)
      			@user.update(score: @user.score-2)
      		end
    	end
    	redirect_to institution_path(@rating_comment.rating.institution.id)
  	end

	private

	def rating_comment_params
		params.require(:rating_comment).permit(:user_id,:rating_id,:text)
	end

	def get_rating_comment
		@rating_comment=RatingComment.find(params[:id])
	end
end
