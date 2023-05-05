require 'application_system_test_case'

class IssueCertificateTest < ApplicationSystemTestCase
  driven_by :selenium, using: :headless_chrome

  test 'when issue certificate' do
    visit new_certificate_path
    fill_in 'Nome', with: 'Marcus Vinicius Pereira De Almeida'
    fill_in 'E-mail', with: 'ola@marcuspereira.dev'
    click_on 'Emitir certificado'

    assert_equal Participant.count, 1
    assert Participant.last.pending?
    assert_includes page.body, 'Solicitação enviada com sucesso'
  end

  test 'when information without name' do
    visit new_certificate_path
    fill_in 'Nome', with: ''
    fill_in 'E-mail', with: 'ola@marcuspereira.dev'
    click_on 'Emitir certificado'

    assert Participant.count.zero?
    assert_includes page.body, 'Nome não pode ficar em branco'
  end

  test 'when information without e-mail' do
    visit new_certificate_path
    fill_in 'Nome', with: 'Marcus Vinicius Pereira De Almeida'
    fill_in 'E-mail', with: ''
    click_on 'Emitir certificado'

    assert Participant.count.zero?
    assert_includes page.body, 'E-mail não pode ficar em branco'
  end

  test 'when information without name and e-mail' do
    visit new_certificate_path
    fill_in 'Nome', with: ''
    fill_in 'E-mail', with: ''
    click_on 'Emitir certificado'

    assert Participant.count.zero?
    assert_includes page.body, 'E-mail não pode ficar em branco'
    assert_includes page.body, 'Nome não pode ficar em branco'
  end
end
