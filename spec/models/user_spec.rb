require 'spec_helper'

describe User do
  describe 'validations' do
    it 'validates length of password' do
      subject.password = 'abc'
      subject.should have(1).error_on(:password)
    end
    it 'validates format of email' do
      subject.should have(1).error_on(:email)
    end
  end
end
