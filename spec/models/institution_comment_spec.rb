require 'rails_helper'

RSpec.describe InstitutionComment, type: :model do
	let!(:user){create(:user)}
  	let!(:institution){create(:institution)}
	subject{
		build(:institution_comment)
	}

	context "validation" do
 		it "is valid with valid atributes" do
 			expect(subject).to be_valid
		end
	end

	context "association" do
  		it { should belong_to (:user)}
  		it { should belong_to (:institution)}
  	end
end
