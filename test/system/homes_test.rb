require 'application_system_test_case'

class HomesTest < ApplicationSystemTestCase
  driven_by :selenium, using: :headless_chrome

  test 'should redirect to twitter profile' do
    visit root_path

    find('i.fa-twitter').click

    page.driver.browser.switch_to.window page.driver.browser.window_handles.last do
      assert current_url == 'https://twitter.com/marcuxyz'
    end
  end

  test 'should redirect to github profile' do
    visit root_path

    find('i.fa-github').click

    page.driver.browser.switch_to.window page.driver.browser.window_handles.last do
      assert current_url == 'https://github.com/marcuxyz'
    end
  end

  test 'should redirect to youtube profile' do
    visit root_path

    find('i.fa-youtube').click

    page.driver.browser.switch_to.window page.driver.browser.window_handles.last do
      assert current_url == 'https://www.youtube.com/@MarcusPereira2022'
    end
  end

  test 'should redirect to Flask Masterclass course' do
    visit root_path

    click_on 'Flask Masterclass'

    page.driver.browser.switch_to.window page.driver.browser.window_handles.last do
      assert current_url == 'https://www.youtube.com/playlist?list=PLxIrGEv-x-afU0SA3TIaLn4sAqtLqse06'
    end
  end

  test 'should contains resources on posts' do
    create(:post, :with_resources)

    visit root_path

    within '#posts' do
      assert page.has_content? Resource.last.name
    end
  end
end
