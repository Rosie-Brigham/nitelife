require 'spec_helper'
 
describe SelectedEventMailer do
  let(:selected_event) {  FactoryGirl.create(:selected_event)}
 
  it "sends an email" do
    expect { SelectedEventMailer.event_alert(selected_event).deliver }.to change { ActionMailer::Base.deliveries.count }.by(1)
  end
end