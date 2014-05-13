require 'spec_helper'

describe SelectedArtistsController do

  describe "when logged in" do
    let(:user) {FactoryGirl.create(:user)}

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
  end

  describe "when not logged on" do
    describe "GET#index" do
      it 'should redirect away' do
        get :index
        response.should redirect_to events_path
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:selected_artist) { FactoryGirl.create(:selected_artist) }
    it 'will remove a selected event' do
      expect {
          delete :destroy, id: selected_artist.id
        }.to change{SelectedArtist.count}.from(1).to(0)
    end
  end
end