require 'test_helper'

class ResourceTest < ActiveSupport::TestCase
  subject { create(:resource) }

  context 'presence: true' do
    should validate_presence_of(:name)
    should validate_presence_of(:url)
  end

  context 'uniqueness: true' do
    should validate_uniqueness_of(:url).ignoring_case_sensitivity
    should validate_uniqueness_of(:name).ignoring_case_sensitivity
  end

  context 'associations' do
    should belong_to(:post).class_name('Post')
  end
end
