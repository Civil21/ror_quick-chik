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

	context "when time of work is not valid format" do
		it "should not be valid" do
			subject.mondayStart = "53255"
			subject.mondayEnd = "53/55"
			subject.tuesdayStart = "53.55"
			subject.tuesdayEnd = "53*55"
			subject.wednesdayStart = "5355"
			subject.wednesdayEnd = "53"
			subject.thursdayStart = "53;55"
			subject.thursdayEnd = "53255"
			subject.fridayStart = "53255"
			subject.thursdayEnd = "53255"
			subject.saturdayStart = "53255"
			subject.saturdayEnd = "53255"
			subject.sundayStart = "53255"
			subject.sundayEnd = "53255"
			expect(subject).to_not be_valid
		end
end
	context "association" do
  		it { should belong_to(:institution)}
  	end

end