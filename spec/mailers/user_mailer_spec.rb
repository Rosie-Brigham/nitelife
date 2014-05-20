require 'spec_helper'
 
describe UserMailer do
  let(:user) {  FactoryGirl.create(:user)}
 
  it "sends an email" do
    expect { UserMailer.welcome_email(user).deliver }.to change { ActionMailer::Base.deliveries.count }.by(1)
  end
end