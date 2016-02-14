require 'rails_helper.rb'

describe UsersController, :type => :controller do 
  
  before do
    @user = User.create!(first_name: "Marek", last_name: "Dano", email: "peter@examp;e.com", password: "123456789")
  end

  describe "Get #show" do
    context "User is logged in" do
      before do
        sign_in @user
      end

      it "load correct uer details" do
        get :show, id: @user.id
        expect(response).to be_success
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq @user
      end
    end

    context "No user is logged in" do
      it "redirects to login" do
        get :show, id: @user.id
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end