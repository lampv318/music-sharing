require 'test_helper'

class SharedVideosInterfaceTest < ActionDispatch::IntegrationTest
  test "shared videos interface" do
    # guest can see shared video
    get root_path
    assert_select 'iframe', count: 3

    # guest login
    log_in_as(users(:michael))
    get root_path
    assert_select 'iframe', count: 3

    # user share a video
    post shared_videos_path, params: { url: 'https://www.youtube.com/watch?v=1CTced9CMMk&list=RDRKhsHGfrFmY&index=2' }
    get root_path
    assert_select 'iframe', count: 4

    # user loggout
    delete logout_path
    get root_path
    assert_select 'iframe', count: 4
  end
end
