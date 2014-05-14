require 'spec_helper'

describe Event do

  describe "validations" do
    it "validates the presence of a event name" do
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
      subject {FactoryGirl.create(:out_of_date_event)}
      subject.should have(1).error_on(:time)
    end

  end

  describe 'unquie validations' do

    before do
      same_event
      subject      
    end
     
    let(:same_event) {FactoryGirl.create(:same_event)}
    subject {FactoryGirl.build(:event)}

    it 'cannot save the same event twice' do
      # require 'pry';binding.pry
      subject.should have(1).errors_on(:last_id)
    end
  end

end
