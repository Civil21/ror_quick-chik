require 'rails_helper' 

RSpec.describe CategoriesController, type: :controller do 

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end


context 'GET #show' do
let!(:institution){create :institution}
let!(:category) { create :category }
institution.category=category.id

it 'should success and render to edit page' do
get :show, params: { id: category.id }
expect(response).to have_http_status(200)
end
end
end

