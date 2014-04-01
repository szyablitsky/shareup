require 'spec_helper'

describe WelcomeController do

  describe '#index' do
    before(:each) { get :index }
    it { expect(response).to render_template :index }
  end

  describe '#dashboard' do
    context 'with signed in user' do
      before :each do
        sign_in FactoryGirl.create(:user)
        get :dashboard
      end

      it { expect(response).to render_template layout: 'layouts/angular' }
    end

    context 'without signed in user' do
      before(:each) { get :dashboard }
      it { expect(response).to redirect_to new_user_session_path }
    end
  end

end
