require 'spec_helper'

describe Users::SessionsController do

  before(:each) { @request.env["devise.mapping"] = Devise.mappings[:user] }

  describe '#show_current_user' do
    context 'not logged in' do
      before(:each) { get :show_current_user }

      it { expect(response.status).to eq(401) }
    end
  
    context 'signed in' do
      before :each do
        sign_in FactoryGirl.create(:user)
        get :show_current_user
      end
      
      it { expect(response.status).to eq(200) }
    end
  end
end
