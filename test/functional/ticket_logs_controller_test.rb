require 'test_helper'

class TicketLogsControllerTest < ActionController::TestCase
  setup do
    @ticket_log = ticket_logs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ticket_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ticket_log" do
    assert_difference('TicketLog.count') do
      post :create, :ticket_log => @ticket_log.attributes
    end

    assert_redirected_to ticket_log_path(assigns(:ticket_log))
  end

  test "should show ticket_log" do
    get :show, :id => @ticket_log.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ticket_log.to_param
    assert_response :success
  end

  test "should update ticket_log" do
    put :update, :id => @ticket_log.to_param, :ticket_log => @ticket_log.attributes
    assert_redirected_to ticket_log_path(assigns(:ticket_log))
  end

  test "should destroy ticket_log" do
    assert_difference('TicketLog.count', -1) do
      delete :destroy, :id => @ticket_log.to_param
    end

    assert_redirected_to ticket_logs_path
  end
end
