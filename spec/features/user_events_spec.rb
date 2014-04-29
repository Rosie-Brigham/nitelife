require 'spec_helper'

feature "User Events" do

  context 'when logged in and created events' do
    let(:user) {FactoryGirl.create(:user)}
    let(:event) {FactoryGirl.create(:event, user: user)}
  
    before do
      login_as(user)
    end

    scenario "should have an index of personalised events" do
      visit '/user_events'
    
      page.should have_content "Your created events"
    end


  end
end