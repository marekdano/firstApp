require 'rails_helper'

describe CommentsController, :type => :controller do 
  before do 
    @user = FactoryGirl.create(:user)
    @admin = FactoryGirl.build(:admin)
    @product = FactoryGirl.create(:product)
    @product.comments.create!(rating: 4, user: @user, body: "Awful bike!")
  end

  describe "Post #create" do 
    context "User is NOT logged in," do
      
      it "create a new comment" do 
        @product.comments.create!(rating: 4, user: @user, body: "Awful bike!")
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
    end

    context "User is logged in," do 
      before do
        sign_in @user
      end

      it "create another new comment" do 
        # this test case failing
        comment_params = FactoryGirl.attributes_for(:comment)
        expect { post :create, :comment => comment_params }
        .to change(Comment, :count).by(1)

        expect(response).to be_success
      end
    end
  end

  describe "Delete #destroy" do
    context "Admin is logged in, " do
      before do
        sign_in @admin
      end

      it "delete the comment" do
        delete :destroy, id: @product.comments.id
        expect(response).to be_success
      end
    end
  end
end
