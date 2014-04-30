require 'spec_helper'

describe UserEventsController do

let(:user) {FactoryGirl.create(:user)}
let(:event) {FactoryGirl.create(:event, user: user)}

  describe "GET#index" do
    describe "when logged in" do
      
      before do
        sign_in user
      end

      it 'shows a list of users events' do
        get :index
        response.should be_ok
      end
    end
  

    describe "when not logged in" do
      it 'redirects away from the index page' do
        get :index
        response.should redirect_to events_path
      end
    end

  end

end
