# Preview all emails at http://localhost:3000/rails/mailers/participant_mailer
class ParticipantMailerPreview < ActionMailer::Preview
  def welcome
    ParticipantMailer.with(participant_id: Participant.last.id).welcome
  end
end
