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

      it { expect(response).to render_template :dashboard }
      it { expect(response).to render_template layout: 'layouts/angular' }
    end

    context 'without signed in user' do
      before(:each) { get :dashboard }
      pending { expect(response).to redirect_to :index }
    end
  end

end
