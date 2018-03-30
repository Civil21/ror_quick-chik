require 'rails_helper'

RSpec.describe Rating, type: :model do
	let!(:user){create(:user)}
	let!(:institution){create(:institution)}
	subject{
		build(:rating)
	}

	context "validation" do
 		it "is valid with valid atributes" do
 			expect(subject).to be_valid
		end
	end

	context "association" do
  		it { should belong_to (:user)}
  		it { should belong_to (:institution)}
  		it { should have_many (:rating_comments)}
  		it { should have_many (:rating_votes)}
  	end
end
