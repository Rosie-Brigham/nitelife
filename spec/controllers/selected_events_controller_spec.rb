require 'spec_helper'

describe SelectedEventsController do

  describe 'GET#index' do
    it 'should list the selected events' do
      get :index
      response should_be ok
    end
  end

end
