require 'rails_helper'

RSpec.describe UserparamsController, type: :controller do
let!(:user) { build(:user, email: "test@gmail.com") }

login_user

let!(:userparam){create(:userparam ,user_id: subject.current_user.id )}


 it "should have a current_user" do
    expect(subject.current_user).to_not eq(nil)
  end

    describe 'GET #edit' do
    before do
      subject.current_user.userparam.update(full_name: "tester")
    end  
    it "should find current_user and open form for edit userparam" do
      get :edit, params: {id: subject.current_user.userparam.id}
      expect(subject.current_user.userparam.full_name).to eq("tester")
      expect(subject.current_user.userparam.full_name).to_not eq(userparam.full_name)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: {id: subject.current_user.userparam.id}
      expect(response).to have_http_status(:success)
    end
  end


    describe 'PATCH #update' do 
    it "should update userparam and redirect userparams" do                      #нічо не трогати магія
      patch :update, params: { id: subject.current_user.id, userparam: {name: "tester2"}}
      expect(subject.current_user.userparam.name).to eq("tester2")
      expect(response).to redirect_to userparam_path(subject.current_user.id)
      end
    end

 #   describe 'DELETE #destroy' do
  #    it "should delete userparam and redirect to root" do
   #    delete :destroy, params: {id: subject.current_user.userparam.id, email: "test@gmail.com"}
    #    expect(subject.current_user.userparam).to_not eq(nil)
     #   expect(response).to redirect_to root_path
     # end
   # end
end
