require 'spec_helper'

describe SelectedEventsController do

  describe "when logged in" do
    let(:user) {FactoryGirl.create(:user)}
    let!(:selected_event) {FactoryGirl.create(:selected_event)}
    let(:event) { selected_event.event }

    before do
      sign_in user
    end

    describe 'GET#index' do
      describe 'when I have selected events' do
        it 'should list the selected events' do
          get :index
          response.should be_ok
        end
      end
    end

    describe "POST#create" do
      it "save a new selected_event" do
          expect {
            post :create, event_id: event
          }.to change{ SelectedEvent.count}.by(1)       
        end
    end

    describe "DELETE #destroy" do
      # let!(:selected_event) { FactoryGirl.create(:selected_event) }
      it 'will remove a selected event' do
        expect {
            delete :destroy, id: selected_event.id
          }.to change{SelectedEvent.count}.from(1).to(0)
      end
    end
  end

  describe "when not logged on" do
    describe "GET#index" do
      it 'should redirect away' do
        get :index
        response.should redirect_to events_path
      end
    end
  end  
end
