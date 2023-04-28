class HomeControllerTest < ActionDispatch::IntegrationTest
  test 'should be ok' do
    get root_path

    assert_response :success
  end
end
