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

  end
end
