class VotesController < ApplicationController
	before_action :authenticate_user!
	before_action :get_object

	def positiv_vote
		if current_user.id != @object.user.id
			if @vote==nil
				@vote=Vote.create(user_id: current_user.id,resource_type: @object.class.name,resource_id: @object.id,score: 1)
				@user.score+=1
	    	else	
		    	if @vote.score != 1
	    			@user.score+=@vote.score
	        		@vote.update(score: 1)
	        	end
	    	end
	    	@user.save
		end
	    redirect_back(fallback_location: root_path)
	end

	def negativ_vote
		if current_user.id != @object.user.id
			if @vote==nil
		    	@vote=Vote.create(user_id: current_user.id,resource_type: @object.class.name,resource_id: @object.id,score: -1)
		    	@user.score+=-1
		    else
		    	if @vote.score != -1
	    			@user.score+=@vote.score
	        		@vote.update(score: -1)
	        	end
		    end
	    	@user.save
		end
	    redirect_back(fallback_location: root_path)
	end

	private

	def get_object
		@object=params[:type].constantize.find(params[:id])
		@user=@object.user.userparam
		@vote=Vote.find_by(user_id: current_user.id,resource_type: @object.class.name,resource_id: @object.id)
	end

end