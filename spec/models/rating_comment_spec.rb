require 'rails_helper'

RSpec.describe RatingComment, type: :model do
  let!(:user){create(:user)}
  let!(:institution){create(:institution)}
  let!(:rating){create(:rating)}
  subject{
		build(:rating_comment)
}
	context "validation" do
 		it "is valid with valid atributes" do
 			expect(subject).to be_valid
		end
	end

	context "association" do
  		it { should belong_to (:user)}
  		it { should belong_to (:rating)}
  	end
end
