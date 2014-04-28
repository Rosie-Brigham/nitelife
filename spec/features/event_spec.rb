require 'spec_helper'

feature "Events" do
  
  scenario "Should have an index of events" do
    event = FactoryGirl.create(:event)
    visit '/events'
    
    page.should have_content event.name
  end

  context "when logged in" do
    let(:user) {FactoryGirl.create(:user)}
    let(:event) {FactoryGirl.create(:event, user: user)}
  
  before do
    login_as(user)
  end

    scenario "when editing a event" do
      visit "/events/#{event.id}"
      click_link 'Edit event'
      fill_in "Name", :with => "Labyrinth"
      click_button 'Update' 
      page.should have_content "Labyrinth"
    end
    
    scenario "when deleting a event" do
      visit "/events/#{event.id}"
      click_button 'Delete Event'
      expect(page).to have_text("That event has been deleted")
    end
  end

  context "when not logged in" do
    scenario "asking for log in" do
      visit "/events"
      click_link 'Add an event'
      expect(page).to have_text("You need to sign in or sign up before continuing.")
    end
  end

end