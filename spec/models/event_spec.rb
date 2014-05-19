require 'spec_helper'

describe Event do

  describe "validations" do
    it "validates the presence of an event name" do
      subject.should have(1).error_on(:name)
    end

    it "validate presence of a genre" do
      subject.should have(1).error_on(:genre)
    end

    it "validate presence of a artist" do
      subject.should have(1).error_on(:artist)
    end

    it "validate presence of a venue" do
      subject.should have(1).error_on(:venue)
    end

    it "validate presence of a date" do
      subject.should have(1).error_on(:date)
    end

    it "validate presence of a time" do
      subject.should have(1).error_on(:time)
    end    

    it 'cannot save a date in the past' do
      event = FactoryGirl.build(:out_of_date_event)
      event.should have(1).error_on(:date)
    end

    it 'adds http:// to a url if missing before validations' do
      event = FactoryGirl.build(:event, url: 'www.ilovefwd.com')
      event.valid?
      event.url.should eq 'http://www.ilovefwd.com'
    end

  end

  describe 'unquie validations' do
     
    let(:existing_event) { FactoryGirl.create(:event) }
    subject { FactoryGirl.build(:event, lastfm_id: existing_event.lastfm_id) }

    it 'cannot save the same event twice' do
      subject.should have(1).errors_on(:lastfm_id)
    end
  end

end
