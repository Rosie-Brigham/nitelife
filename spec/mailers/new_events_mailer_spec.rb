require 'spec_helper'
 
describe NewEventsMailer do
  let(:user) {  FactoryGirl.create(:user)}
 
  it "sends an email" do
    expect { NewEventsMailer.confirmation_email(user).deliver }.to change { ActionMailer::Base.deliveries.count }.by(1)
  end
end