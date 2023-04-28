require 'test_helper'

class HomeTest < ActionDispatch::IntegrationTest
  test 'should contains text in index' do
    get root_path

    assert response.body.include? 'MARCUS'
    assert response.body.include? 'Pereira'
    assert response.body.include? 'O SENHOR é o meu pastor; nada me faltará. Salmos 23:1 NAA'
  end

  test 'should contains mural' do
    get root_path

    assert response.body.include? 'Mural'
    assert response.body.include? 'Visualize informações, atualizações de eventos e cursos.'
  end
end
