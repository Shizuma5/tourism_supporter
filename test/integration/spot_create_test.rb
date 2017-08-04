require 'test_helper'

class SpotCreateTest < ActionDispatch::IntegrationTest
  test "invalid spot information" do
    get new_spot_path
    picture = fixture_file_upload("#{Rails.root}/test/fixtures/tukuba1.jpg", 'image/jpg')
    assert_no_difference 'Spot.count' do
      post spots_path, params: { spot: { placeName:  "",
                                         lat: 0,
                                         lng: 0,
                                         picture:  picture} }
    end
    assert_template 'spots/new'
  end

  test "valid spot information" do
    get new_spot_path
    picture = fixture_file_upload("#{Rails.root}/test/fixtures/tukuba1.jpg", 'image/jpg')
    p picture
    assert_difference 'Spot.count', 1 do
      post spots_path, params:  { spot: { placeName:  "a",
                                         lat: 0,
                                         lng: 0,
                                         picture: picture } }
    end
    follow_redirect!
    assert_template 'spots/show'
  end
end
