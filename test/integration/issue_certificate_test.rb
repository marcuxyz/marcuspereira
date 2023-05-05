require 'test_helper'

class IssueCertificateTest < ActionDispatch::IntegrationTest
  test 'should contains title' do
    get new_certificate_path

    assert_includes response.body, 'Emitir certificado de participação'
  end

  test 'must sent credentials for issue certificate' do
    params = { participant: { name: 'Marcus Vinicius Pereira De Almeida', email: 'ola@marcuspereira.dev' } }

    post(certificates_path, params:)
    follow_redirect!

    assert_includes response.body, 'Solicitação enviada com sucesso'
    assert Participant.last.pending?
  end

  test 'must sent credentials for issue certificate without name' do
    params = { participant: { name: '', email: 'ola@marcuspereira.dev' } }

    post(certificates_path, params:)

    assert_includes response.body, 'Nome não pode ficar em branco'
    assert Participant.count.zero?
  end

  test 'must sent credentials for issue certificate without e-mail' do
    params = { participant: { name: 'Marcus Vinicius Pereira De Almeida', email: '' } }

    post(certificates_path, params:)

    assert_includes response.body, 'E-mail não pode ficar em branco'
    assert Participant.count.zero?
  end
end
