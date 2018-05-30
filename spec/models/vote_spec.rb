require 'rails_helper'

RSpec.describe Vote, type: :model do
	let!(:user){create(:user)}
	subject{
		build(:vote)
	}

	context "association" do
  		it { should belong_to(:user)}
  	end
end
