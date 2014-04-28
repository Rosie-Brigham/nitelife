require 'spec_helper'

describe EventsController do

  
  # add sign in thing here...

  it "should create a new event" do

  end

  it "has a show action, to show a new event" do

  end

  describe "POST#create" do
    describe "with valid params" do
      it "save a record" do
        expect {
          post :create, event: {name: "FWD", genre: 'bass', artist: 'sophie', date: '10/10/2014', time: '14', venue: "dance tunnel" }
        }.to change{ Event.count }.from(0).to(1)        
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
        {event: {name: "", genre: "", artist: "", date: "", time: "", venue: "dance tunnel"} }
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


end