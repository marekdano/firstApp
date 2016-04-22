require 'rails_helper'

describe Admin::ProductsController, :type => :controller do
  
  before do
    @user = FactoryGirl.create(:user)
    @admin = FactoryGirl.create(:admin)
  end

  describe "Get #create, " do
    context "Admin is logged in, " do
      
      before do
        sign_in @admin
      end

      it "loads the list of products" do
        @product = FactoryGirl.create(:product, name: "bike", price: 109.00)
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
    end 
  end

  describe "Get #index, " do
    context "Admin is logged in, " do
      
      before do
        sign_in @admin
      end

      it "loads the list of products" do
        get :index
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
    end 
    
    context "Admin is NOT logged in, " do
      it "load the list of products" do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end 
  end

  describe "Get #new, " do
    context "Admin is logged in, " do
      
      before do
        sign_in @admin
      end

      it "loads the list of products" do
        get :new
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
    end 
  end

  describe "Get #edit, " do
    context "Admin is logged in, " do
      
      before do
        sign_in @admin
        @product3 = FactoryGirl.create(:product, name: "lovely bike", price: 109.00)
      end

      it "loads the list of products" do
        get :edit, { id: @product3.id } 
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
    end 
  end

  describe "Delete #destroy, " do
    context "Admin is logged in, " do
      
      before do
        sign_in @admin
        @product4 = FactoryGirl.create(:product, name: "nice bike", price: 109.00)
      end

      it "deletes the product" do
        delete :destroy, { id: @product4.id } 
        expect(response).to redirect_to(admin_products_path)
      end
    end 
  end
end