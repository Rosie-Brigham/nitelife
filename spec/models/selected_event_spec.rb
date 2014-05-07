require 'spec_helper'

describe SelectedEvent do

  subject! {FactoryGirl.create(:selected_event)}

  describe '#check_events' do
    it 'should check if the event needs a reminder' do
      SelectedEvent.check_events.should eq [subject]
    end
  end

  describe '#ready for reminder' do
    let(:futures) {FactoryGirl.create(:future_selected_event)}
    let(:future) {FactoryGirl.create(:future_event)}
    let(:ouchdate) {FactoryGirl.create(:out_of_date_event)}


    it 'is false when the event was yesterday' do
      Timecop.freeze(Date.today + 2.days) do
        subject.ready_for_reminder?.should eq false
      end
    end

    it 'is true when its the day before' do
      subject.ready_for_reminder?.should eq true
    end

    it 'is false when is the event is next month' do
      
      future_selected_event = FactoryGirl.create(:future_selected_event)
      future_selected_event.ready_for_reminder?.should eq false

    end   
  end

  describe '#deliver reminder' do
    it 'should send an email a day before the event' do
      expect {subject.deliver_reminder}.to change {ActionMailer::Base.deliveries.count }.by(1)
    end
  end

  describe '#send_reminder_emails' do
    it "gathers today's reminders" do
      FactoryGirl.create(:selected_event)
      FactoryGirl.create(:selected_event)
      FactoryGirl.create(:future_selected_event)

      expect {
        SelectedEvent.send_reminder_emails
      }.to change {ActionMailer::Base.deliveries.count }.by(3)
      # this includes the let! at the top

    end
  end

end