require 'test_helper'

class ParticipantTest < ActiveSupport::TestCase
  context 'validations' do
    should validate_presence_of(:name)
    should validate_presence_of(:email)
  end

  test 'should have pending status' do
    participant = create(:participant)

    assert participant.pending?
    assert_not participant.accept?
    assert_not participant.sent?
  end

  test 'should have accept status' do
    participant = create(:participant, status: :accept)

    assert participant.accept?
    assert_not participant.pending?
    assert_not participant.sent?
  end

  test 'should have sent status' do
    participant = create(:participant, status: :sent)

    assert participant.sent?
    assert_not participant.accept?
    assert_not participant.pending?
  end
end
