require 'spec_helper'

feature 'Select Events' do 

  scenario "should have a search function" do
    event = FactoryGirl.create(:event)
    visit '/selected_events'
    fill_in "search", :with => 'big'
    page.should have_content 'big night'
  end

  context 'when logged in' do
    let(:user) {FactoryGirl.create(:user)}
    let(:event) {FactoryGirl.create(:event, user: user)}
  
    before do
      login_as(user)
    end


    scenario 'when I have selected events' do
      visit '/selected_events'
      expect(page).to have_text("Upcoming Events")
    end

    scenario 'when I have not selected events' do
      visit '/selected_events'
      expect(page).to have_text("Oh no! It seems you dont have any selected events, go and find some!")
    end

  end

  context 'when not logged in' do

    scenario 'I should be redirected if I try to get to the selected users path' do
      visit '/selected_events'
      expect(page).to have_text("naughty developer")
    end

  end
 
end