require 'spec_helper'

describe EventsController do

let(:user) {FactoryGirl.create(:user)}
let(:event) {FactoryGirl.create(:event, user: user)}
  

  describe "when not logged in" do
    it "has an index action, to show all events" do
      get :index
      response.should be_ok
    end  
  end

  describe "when logged in" do
    before do
      sign_in user
    end

    it "has a show action, to show a new event" do
      # @event = FactoryGirl.create(:event)
      get :show, id: event.id
      response.should be_ok
    end

    describe "POST#create" do

      describe "with valid params" do
        it "save a record" do
          expect {
            post :create, event: {name: "FWD", genre: 'bass', artist: 'sophie', date: '10/10/2014', time: '14', venue: "dance tunnel", url: 'http://www.ilovefwd.com' }
          }.to change{ Event.count }.from(0).to(1)        
        end
      end

      describe "with invalid params" do
        let(:invalid_params) do
            {event: {name: "", genre: "", artist: "", date: "", time: "", venue: ""} }
          end

        it "renders the form again" do
          post :create, invalid_params
          response.should render_template(:new)
        end
      end
    end

    describe "PUT #update" do
      let!(:event) { FactoryGirl.create(:event) }

      describe "with valid params" do

        let(:valid_params) { FactoryGirl.attributes_for(:event) }
        
        it "edits an event" do

          put :update, id: event.id, event: {name: "FWD", genre: 'bass', artist: 'sophie', date: '10/10/2014', time: '14', venue: "dance tunnel" }
          event.reload
          event.genre.should eq "bass"

        end 

        it "updates an event" do
          expect {
            put :update, id: event.id, event: {name: "FWD", genre: 'bass', artist: 'sophie', date: '10/10/2014', time: '14', venue: "dance tunnel" }
          }.to_not change { Event.count }
        end
      end

      describe 'with invalid params' do
        
        let(:invalid_params) do
          {event: {name: "", genre: "", artist: "", date: "", time: "", venue: ""} }
        end

        it 'does not save a new event record' do
          expect {
            post :create, invalid_params
            }.to_not change {Event.count}

        end

        it 'renders a new form for event' do
          post :create, invalid_params
          response.should render_template(:new)
        end
      end
    end

    describe "GET #edit" do
      let(:different_event) do
        FactoryGirl.create(:event)
      end

      it 'does not let you edit events that are not yours' do
          get :edit, id: different_event.id
          response.should redirect_to event_path(different_event)
      end
    end

    describe "DELETE #destroy" do
      let!(:event) { FactoryGirl.create(:event, user: user) }

      it "will delete your event" do
        expect {
          delete :destroy, id: event.id
        }.to change{Event.count}.from(1).to(0)
      end

      it 'does not let you delete events that are not yours' do
        different_event = FactoryGirl.create(:event, lastfm_id: '23')
        expect {
          delete :destroy, id: different_event.id
        }.to_not change{Event.count}
      end
    end
  end

  describe "when an admin" do
    let!(:event) { FactoryGirl.create(:event) }
    before do
      sign_in user
      user.update_attribute :admin, true
    end

    it 'allows you to edit things' do
       put :update, id: event.id, event: {name: "FWD", genre: 'bass', artist: 'sophie', date: '10/10/2014', time: '14', venue: "dance tunnel" }
        event.reload
        event.genre.should eq "bass"
    end

    it "deletes an event" do

      expect {
        delete :destroy, id: event.id
        }.to change{Event.count}.from(1).to(0)
    end
  end

end