class WelcomeJob < ApplicationJob
  queue_as :default

  def perform(participant)
    send_email(participant) if participant.present?
  end

  private

  def send_email(participant)
    ParticipantMailer.with(participant_id: participant.id).welcome.deliver_now
  end
end
