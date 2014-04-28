require 'spec_helper'

describe EventsController do

  let(:event) {FactoryGirl.create(:event)}
  
  # add sign in thing here...

  it "should create a new event" do

  end

  it "has a show action, to show a new event" do

  end

  describe "POST#create" do
    describe "with valid params" do
      it "save a record" do
        expect {
          post :create, event: {name: "FWD", genre: 'bass', artist: 'sophie', date: '10/10/2014', time: '14' }}.to change{ Event.count }.from(0).to(1)          
      end
    end
  end


  
end