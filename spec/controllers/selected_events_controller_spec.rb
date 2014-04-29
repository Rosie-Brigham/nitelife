require 'spec_helper'

describe SelectedEventsController do

  describe 'GET#index' do
    it 'should list the selected events' do
      get :index
      response.should be_ok
    end
  end

end
