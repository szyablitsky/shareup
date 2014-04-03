require 'spec_helper'

describe Api::SharesController do
  describe '#index' do
    before(:each) { get :index }
    it { expect(json_response).to eq [] }
  end

  describe '#create' do
    context 'always' do
    end

    context 'with valid username' do
    end

    context 'with nonregisterd email' do
    end

    context 'with bad input' do
    end
  end
end
