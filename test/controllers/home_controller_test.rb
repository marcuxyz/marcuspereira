class HomeControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get root_path

    assert_response :success
    assert response.body.include? 'MARCUS PEREIRA'
  end
end
