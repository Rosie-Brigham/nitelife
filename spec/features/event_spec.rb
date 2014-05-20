require 'spec_helper'

feature "Events" do
  
  scenario "Should have an index of events" do
    event = FactoryGirl.create(:event)
    visit '/events'
    
    page.should have_content event.name

  end
  
  scenario 'It should not show events in the past' do
    event = FactoryGirl.create(:event)
    Timecop.freeze(Date.today + 2.days) do
    visit '/events'
    page.should_not have_content event.name
    end

  end

  context "when logged in" do
    let(:user) {FactoryGirl.create(:user)}
    let(:event) {FactoryGirl.create(:event, user: user)}
  
  before do
    login_as(user)
  end

    scenario "when editing a event" do
      visit "/events/#{event.id}"
      click_link 'Edit'
      fill_in "Name", :with => "Labyrinth"
      click_button 'Update' 
      page.should have_content "Labyrinth"
    end
    
    scenario "when deleting a event" do
      visit "/events/#{event.id}"
      click_button 'Delete'
      expect(page).to have_text("That event has been deleted")
    end
  end

end