require 'rails_helper'

RSpec.describe Institution, type: :model do
  subject{
		build(:institution)
	}

  context "validation" do
 		it "is valid with valid atributes" do
 			expect(subject).to be_valid
		end
	end

	context "association" do
  		it { should have_and_belong_to_many(:category)}
  		it { should have_one(:work_time)}
  		it { should have_many(:ratings)}
  		it { should have_many(:institution_comments)}
  	end
end
