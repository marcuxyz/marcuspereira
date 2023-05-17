require 'test_helper'

class ParticipantMailerTest < ActionMailer::TestCase
  test 'send welcome email to certificate request' do
    participant = create(:participant)

    email = ParticipantMailer.with(participant_id: participant.id).welcome

    email.deliver_now

    assert_equal ['oi@marcuspereira.dev'], email.from
    assert_equal [participant.email], email.to
    assert_equal 'Bem-vindo(a)! Sua solicitação foi recebida', email.subject
  end
end
