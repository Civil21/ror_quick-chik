require 'rails_helper'

RSpec.describe InstitutionCommentsController, type: :controller do
let!(:user) { build(:user, email: "test@gmail.com") }

login_user

it "should have a current_user" do
    expect(subject.current_user).to_not eq(nil)
  end

  let!(:institution) { build(:institution) }

  describe 'POST #create' do
    it "should create intstitution comment and redirect" do
      post :create, params: {:institution_comment: {text: "Test"}}
      expect(subject.intstitution.id.intstitution_comment.text).to eq("Test")
      expect(response).to redirect_to institution_institution_comments_path(subject.intstitution.id)
    end
  end



end
