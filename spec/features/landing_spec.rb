require 'spec_helper'

feature "Landing" do

  scenario "When I click the button" do
    visit "/"
    click_button 'Enter'
    page.should have_content "All Events"
  end
end