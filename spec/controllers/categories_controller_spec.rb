require 'rails_helper' 

RSpec.describe CategoriesController, type: :controller do 

	

  	describe "GET #index" do
    	it "returns http success" do
      		get :index
      		expect(response).to have_http_status(:success)
    	end
  	end

	describe 'GET #show' do
		let!(:category) { create :category }
		let!(:institution){create :institution}
		#let!(:institution){institution.category = Category.find(category.id)}
		it 'should success' do
			get :show, params: { id: category.id }

			#expect(response).to have_http_status(200)
		end
	end
end

