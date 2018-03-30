require 'rails_helper'

RSpec.describe RatingVote, type: :model do
 let!(:user){create(:user)}
 let!(:institution){create(:institution)}
 let!(:rating){create(:rating)}
  subject{
		build(:rating_vote)
	}

	context "association" do
  		it { should belong_to (:user)}
  		it { should belong_to (:rating)}
  	end
end
