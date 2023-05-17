class ParticipantMailer < ApplicationMailer
  def welcome
    @participant = Participant.find(params[:participant_id])

    mail(to: @participant.email, subject: I18n.t('participants.email.messages.success'))
  end
end
