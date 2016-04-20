
def login_admin 
  admin = FactoryGirl.create(:admin)
  login_as(admin, :scope => :admin)
end