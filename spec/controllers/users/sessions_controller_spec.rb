require 'spec_helper'

describe Users::SessionsController do

  before(:each) { @request.env["devise.mapping"] = Devise.mappings[:user] }

  describe 'the user receives a 401 if not logged in at /current_user' do
    before(:each) { get :show_current_user }

    it { expect(response.status).to eq(401) }
  end
  
  describe 'the user receives success user data if signed in' do
    before :each do
      sign_in FactoryGirl.create(:user)
      get :show_current_user
    end
    
    it { expect(response.status).to eq(200) }
  end

end
