require 'rails_helper'

RSpec.describe Userparam, :type => :model do 
	let!(:user){create(:user)}
	subject{
		build(:userparam)
	}

	context "validation" do
 		it "is valid with valid atributes" do
 			expect(subject).to be_valid
		end
	end
	
	context "when userparam name or url is already taken" do
	before do 
		userparam_dub = create(:userparam, user: user)
	end
	it {should_not be_valid}
end

	context "when facebook url is not rigth format" do
		it "should not be valid" do 
			subject.facebook_url = "fssdhhznbz"
			expect(subject).to_not be_valid
		end 
	end

context "association" do
  		it { should belong_to(:user)}
  	end

end
