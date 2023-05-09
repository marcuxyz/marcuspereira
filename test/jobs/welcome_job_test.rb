require 'test_helper'

class WelcomeJobTest < ActiveJob::TestCase
  test 'was executed' do
    participant = create(:participant)

    WelcomeJob.perform_later(participant)

    assert_enqueued_jobs 1
  end

  test '3 participants issue certificate' do
    assert_enqueued_jobs 3 do
      WelcomeJob.perform_later(create(:participant))
      WelcomeJob.perform_later(create(:participant))
      WelcomeJob.perform_later(create(:participant))
    end
  end

  test 'has already been executed' do
    participant = create(:participant)

    WelcomeJob.perform_now(participant)

    assert_enqueued_jobs 0
  end
end
