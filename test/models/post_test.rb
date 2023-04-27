require 'test_helper'

class PostTest < ActiveSupport::TestCase
  context 'validations' do
    should validate_presence_of(:title)
    should validate_presence_of(:content)
    should validate_presence_of(:position)
  end
end
