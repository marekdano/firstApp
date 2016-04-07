
def login_user 
  user = FactoryGirl.create(:user)
  login_as(user, :scope => :user)
end