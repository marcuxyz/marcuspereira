require 'test_helper'

class HomeTest < ActionDispatch::IntegrationTest
  test 'should contains text' do
    get root_path

    assert_includes response.body, 'MARCUS'
    assert_includes response.body, 'PEREIRA'
    assert_includes response.body, 'O SENHOR é o meu pastor; nada me faltará. Salmos 23:1 NAA'
  end

  test 'should contains footer' do
    get root_path

    assert_includes response.body, 'Marcus Pereira; todos os direitos reservados.'
  end

  test 'should contains mural' do
    get root_path

    assert_includes response.body, 'Mural'
    assert_includes response.body, 'Visualize informações, atualizações de eventos e cursos.'
  end

  test 'should contains posts in mural' do
    travel_to Time.zone.local(2023, 4, 28, 11, 20, 30)

    create(:post, title: 'Ruby on Rails - Uma maneira diferente de aprender',
                  content: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.')

    get root_path

    assert_includes response.body, 'Ruby on Rails - Uma maneira diferente de aprender'
    assert_includes response.body, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.'
    assert_includes response.body, '28 de abril, 2023.'
  end

  test 'should no contains posts in mural' do
    get root_path

    assert_includes response.body, 'Nada publicado ainda!'
  end
end
