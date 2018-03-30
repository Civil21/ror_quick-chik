require 'rails_helper'

RSpec.describe InstitutionCommentVote, type: :model do
  let!(:user){create(:user)}
  let!(:institution){create(:institution)}
  let!(:institution_comment){create(:institution_comment)}
  subject{
		build(:institution_comment_vote)
	}

	context "association" do
  		it { should belong_to (:user)}
  		it { should belong_to (:institution_comment)}
  	end
end
