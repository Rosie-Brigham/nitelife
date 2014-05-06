require 'spec_helper'

describe SelectedEvent do

  let!(:selected_event) {FactoryGirl.create(:selected_event)}
  subject {FactoryGirl.create(:selected_event)}

  describe '#check_events' do
    it 'should check if the event needs a reminder' do
      SelectedEvent.check_events.should eq [selected_event]
    end
  end

  describe '#ready for reminder' do
    let(:invalid) {FactoryGirl.create(:out_of_date_selected_event)}

    it 'is true when its the day before' do
      subject.ready_for_reminder?.should eq true
    end

    it 'is false when is is not the day before' do
      invalid.ready_for_reminder?.should eq false
    end
  end

  describe '#deliver reminder' do
    it 'should send an email a day before the event' do
      expect {selected_event.deliver_reminder}.to change {ActionMailer::Base.deliveries.count }.by(1)
    end
  end

  describe '#send_reminder_emails' do
    it "gathers today's reminders" do
      FactoryGirl.create(:selected_event)
      FactoryGirl.create(:selected_event)
      FactoryGirl.create(:out_of_date_selected_event)

      expect {
        SelectedEvent.send_reminder_emails
      }.to change {ActionMailer::Base.deliveries.count }.by(3)
      # this includes the let! at the top

    end
  end

end