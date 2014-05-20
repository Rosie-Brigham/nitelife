require 'spec_helper'

describe SelectedArtistsController do

  describe "when logged in" do
    let(:user) {FactoryGirl.create(:user)}
    let!(:selected_artist) { FactoryGirl.create(:selected_artist) }
    let(:artist) { selected_artist.artist }
    
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
      it "save a new selected_artist" do
          expect {
            post :create, artist_id: artist
          }.to change{ SelectedArtist.count}.by(1)       
        end
    end

    describe "DELETE #destroy" do
      it 'will remove a selected event' do
        expect {
            delete :destroy, id: selected_artist.id
          }.to change{SelectedArtist.count}.from(1).to(0)
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