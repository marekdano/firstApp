require 'rails_helper'

describe CommentsController, :type => :controller do 
  before do 
    @user = FactoryGirl.create(:user)
    @admin = FactoryGirl.create(:admin)
    @product = FactoryGirl.create(:product)
    #@product.comments.create!(rating: 4, user: @user, body: "Awful bike!")
  end

  describe "Post #create" do 
    context "User is NOT logged in," do
      
      it "create a new comment" do 
        comment_params = FactoryGirl.attributes_for(:comment, user: @user)
        expect { post :create, comment: comment_params, product_id: @product.id }
        .to change(Comment, :count).by(0)
      end
    end

    context "User is logged in," do 
      before do
        sign_in @user
      end

      it "create another new comment" do 
        comment_params = FactoryGirl.attributes_for(:comment, user: @user)
        expect { post :create, comment: comment_params, product_id: @product.id }
        .to change(Comment, :count).by(1)
      end
    end
  end

  describe "Delete #destroy" do
    context "Admin is logged in, " do
      before do
        sign_in @admin
      end

      it "delete the comment" do 
        comment = FactoryGirl.create(:comment, product_id: @product.id)
        # Also, test if the action really deletes a comment.
        expect { delete :destroy, id: comment.id, product_id: @product.id}
        .to change{ @product.comments.count }.by(-1)
      end
    end
  end
end
