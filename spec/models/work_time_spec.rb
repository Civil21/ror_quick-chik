require 'rails_helper'

RSpec.describe WorkTime, type: :model do
	let!(:institution){create(:institution)}
	subject{
		build(:work_time)
	}

	context "validation" do
 		it "is valid with valid atributes" do
 			expect(subject).to be_valid
		end
	end

	context "association" do
  		it { should belong_to(:institution)}
  	end

end
