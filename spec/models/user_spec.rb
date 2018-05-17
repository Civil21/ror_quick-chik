require 'rails_helper'

RSpec.describe User, type: :model do
		subject{
		build(:user)
	}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  context "association" do
  		it { should have_one(:userparam)}
  		it { should have_many(:ratings)}
  		it { should have_many(:rating_comments)}
  		it { should have_many(:institution_comments)}
  	end
end
