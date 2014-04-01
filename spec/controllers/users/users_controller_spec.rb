require 'spec_helper'

describe Users::UsersController do
  before(:each) { @request.env["devise.mapping"] = Devise.mappings[:user] }
  
  describe '#is_user' do
    context 'user exists' do
      let(:user) { FactoryGirl.create(:user) }
      before(:each) { post :is_user, { name: user.name } }
    
      it { expect(json_response['success']).to eq(true) }
    end

    context 'user do not exist' do
      before(:each) { post :is_user, { name: 'cleary_not_a_users_name' } }
      
      it { expect(json_response['success']).to eq(false) }
    end
  end
end