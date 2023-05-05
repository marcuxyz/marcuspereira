class CertificateControllerTest < ActionDispatch::IntegrationTest
  test 'should be ok' do
    get new_certificate_path

    assert_response :success
  end
end
