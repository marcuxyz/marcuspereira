class CertificatesController < ApplicationController
  def new
    @participant = Participant.new
  end

  def create
    @participant = Participant.new(participant_params)

    return render :new unless @participant.save

    WelcomeJob.perform_now(@participat)

    redirect_to new_certificate_path, notice: I18n.t('participants.redirect.messages.success')
  end

  private

  def participant_params
    params.require(:participant).permit(:name, :email)
  end
end
