require 'test_helper'

class ParticipantTest < ActiveSupport::TestCase
  context 'validations' do
    should validate_presence_of(:name)
    should validate_presence_of(:email)
  end
end
