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
  end
end
