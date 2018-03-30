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
	
context "association" do
  		it { should belong_to(:user)}
  	end

end
