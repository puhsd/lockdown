require 'test_helper'

class LocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lock = locks(:one)
  end

  test "should get index" do
    get locks_url
    assert_response :success
  end

  test "should get new" do
    get new_lock_url
    assert_response :success
  end

  test "should create lock" do
    assert_difference('Lock.count') do
      post locks_url, params: { lock: { url: @lock.url, user_id: @lock.user_id } }
    end

    assert_redirected_to lock_url(Lock.last)
  end

  test "should show lock" do
    get lock_url(@lock)
    assert_response :success
  end

  test "should get edit" do
    get edit_lock_url(@lock)
    assert_response :success
  end

  test "should update lock" do
    patch lock_url(@lock), params: { lock: { url: @lock.url, user_id: @lock.user_id } }
    assert_redirected_to lock_url(@lock)
  end

  test "should destroy lock" do
    assert_difference('Lock.count', -1) do
      delete lock_url(@lock)
    end

    assert_redirected_to locks_url
  end
end
