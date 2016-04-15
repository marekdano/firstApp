require 'rails_helper'

describe Admin::UsersController, :type => :controller do
  
  before do
    #@user = User.create!(first_name: "Marek", last_name: "Dano", email: "marek@example.com", password: "123456789")
    @user = FactoryGirl.create(:user)
    #@user2 = User.create!(first_name: "Eva", last_name: "Danova", email: "eva@example.com", password: "123456789")
    @user2 = FactoryGirl.create(:user)
    #@admin = User.create!(first_name: "admin", last_name: "admin", email: "admin@example.com", password: "123456789", admin: true)
    @admin = FactoryGirl.create(:admin)
  end

  describe "Get #show" do
    context "User is logged in," do
      before do
        sign_in @user
      end

      it "load correct user details" do
        get :show, id: @user.id
        expect(response).to be_success
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq @user
      end

      it "redirects to the root if another user wants access the other profile" do
        get :show, id: @user2.id
        expect(response).to redirect_to(root_path)
      end
    end

    context "No user is logged in," do
      it "redirects to login" do
        get :show, id: @user.id
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "Get #index" do
    context "Admin is logged in," do
      before do
        sign_in @admin
      end

      it "load users profiles" do
        get :index 
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
    end

    context "Admin is NOT logged in," do
      before do
        sign_in @user
      end

      it "load users profiles" do
        get :index 
        expect(response).to redirect_to(root_path)
      end
    end
  end

end