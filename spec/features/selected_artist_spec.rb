require 'spec_helper'

feature SelectedArtist do

  context 'when logged in' do
    let(:user) {FactoryGirl.create(:user)}
    let(:artist) {FactoryGirl.create(:artist)}
    let(:event) {FactoryGirl.create(:event, artist: artist)}

  
    before do
      login_as(user)
      visit '/selected_artists'
    end

    context 'When I have followed an artist' do
      
      scenario 'and I click follow' do
        visit event_path(event)
        click_button 'Follow'
        expect(page).to have_text("Upcoming Events from your favourite Artist")
        expect(page).to have_text('Jeff')
      end

    end
  end

  context 'when not logged in' do

    scenario 'I should be redirected if I try to get to the selected artist path' do
      visit '/selected_artists'
      expect(page).to have_text("naughty developer")
    end
  end
end