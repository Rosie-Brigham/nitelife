require 'spec_helper'

feature "Events" do
  
  scenario "veiwing a list of events" do
    event = FactoryGirl.create(:event)
    visit '/events'
    
    page.should have_content event.name

  end

  context "when logged in" do
    # create a factory girl user
    # login_as(user)
  end

  scenario "when editing a event" do
    # edit-y stuff with factories and tings
  end
  
  scenario "when deleting a event" do
  end

  context "when not logged in" do
  end

end