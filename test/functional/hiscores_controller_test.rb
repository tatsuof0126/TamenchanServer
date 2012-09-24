require 'test_helper'

class HiscoresControllerTest < ActionController::TestCase
  setup do
    @hiscore = hiscores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hiscores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hiscore" do
    assert_difference('Hiscore.count') do
      post :create, hiscore: { achieved_date: @hiscore.achieved_date, devid: @hiscore.devid, name: @hiscore.name, rank: @hiscore.rank, score: @hiscore.score }
    end

    assert_redirected_to hiscore_path(assigns(:hiscore))
  end

  test "should show hiscore" do
    get :show, id: @hiscore
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hiscore
    assert_response :success
  end

  test "should update hiscore" do
    put :update, id: @hiscore, hiscore: { achieved_date: @hiscore.achieved_date, devid: @hiscore.devid, name: @hiscore.name, rank: @hiscore.rank, score: @hiscore.score }
    assert_redirected_to hiscore_path(assigns(:hiscore))
  end

  test "should destroy hiscore" do
    assert_difference('Hiscore.count', -1) do
      delete :destroy, id: @hiscore
    end

    assert_redirected_to hiscores_path
  end
end
