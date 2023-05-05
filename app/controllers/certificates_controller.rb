class CertificatesController < ApplicationController
  def new
    @certificate = Participant.new
  end

  def create
    @certificate = Participant.new(participant_params)

    return render :new unless @certificate.save

    redirect_to new_certificate_path, notice: I18n.t('participants.redirect.messages.success')
  end

  private

  def participant_params
    params.require(:participant).permit(:name, :email)
  end
end
