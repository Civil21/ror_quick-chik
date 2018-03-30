require 'rails_helper'

RSpec.describe RatingCommentVote, type: :model do
  let!(:user){create(:user)}
  let!(:institution){create(:institution)}
  let!(:rating){create(:rating)}
  let!(:rating_comment){create(:rating_comment)}
    subject{
		build(:rating_comment_vote)
	}

	context "association" do
  		it { should belong_to (:user)}
  		it { should belong_to (:rating_comment)}
  	end
end
