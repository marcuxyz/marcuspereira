class CertificatesController < ApplicationController
  def new; end

  def create
    certificate = Participant.new(participant_params)
    certificate.save!

    redirect_to new_certificate_path, notice: 'Solicitação enviada com sucesso'
  end

  private

  def participant_params
    params.require(:participant).permit(:name, :email)
  end
end
