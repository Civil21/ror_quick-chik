require 'rails_helper'

RSpec.describe Category, type: :model do
  subject{
		build(:category)
	}

	  context "validation" do
 		it "is valid with valid atributes" do
 			expect(subject).to be_valid
		end
	end

	context "when category name is already taken" do
	before do 
		category_dub = create(:category)
	end
	it {should_not be_valid}
end

		context "association" do
  		it { should have_and_belong_to_many(:institution)}
  	end
end
