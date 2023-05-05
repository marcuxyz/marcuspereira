require 'test_helper'

class IssueCertificateTest < ActionDispatch::IntegrationTest
  test 'when contains title' do
    get new_certificate_path

    assert_includes response.body, 'Emitir certificado de participação'
  end

  test 'when issue certificate' do
    params = { participant: { name: 'Marcus Vinicius Pereira De Almeida', email: 'ola@marcuspereira.dev' } }

    post(certificates_path, params:)
    follow_redirect!

    assert Participant.last.pending?
    assert_includes response.body, 'Solicitação enviada com sucesso'
  end

  test 'when information without name' do
    params = { participant: { name: '', email: 'ola@marcuspereira.dev' } }

    post(certificates_path, params:)

    assert Participant.count.zero?
    assert_includes response.body, 'Nome não pode ficar em branco'
  end

  test 'when information without e-mail' do
    params = { participant: { name: 'Marcus Vinicius Pereira De Almeida', email: '' } }

    post(certificates_path, params:)

    assert Participant.count.zero?
    assert_includes response.body, 'E-mail não pode ficar em branco'
  end

  test 'when information without name and e-mail' do
    params = { participant: { name: '', email: '' } }

    post(certificates_path, params:)

    assert Participant.count.zero?
    assert_includes response.body, 'Nome não pode ficar em branco'
    assert_includes response.body, 'E-mail não pode ficar em branco'
  end
end
