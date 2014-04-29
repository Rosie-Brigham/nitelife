require 'spec_helper'

describe UserEventsController do

let(:user) {FactoryGirl.create(:user)}
let(:event) {FactoryGirl.create(:event, user: user)}

  before do
    sign_in user
  end

  describe "index" do
    it 'shows a list of users events' do
      get :index
      response.should be_ok
    end

  end

end
