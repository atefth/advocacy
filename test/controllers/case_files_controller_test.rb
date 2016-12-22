require 'test_helper'

class CaseFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @case_file = case_files(:one)
  end

  test "should get index" do
    get case_files_url
    assert_response :success
  end

  test "should get new" do
    get new_case_file_url
    assert_response :success
  end

  test "should create case_file" do
    assert_difference('CaseFile.count') do
      post case_files_url, params: { case_file: { advocate_id: @case_file.advocate_id, amount_paid: @case_file.amount_paid, appeal_on: @case_file.appeal_on, client_id: @case_file.client_id, convocation_on: @case_file.convocation_on, file_received_on: @case_file.file_received_on, name: @case_file.name, status: @case_file.status } }
    end

    assert_redirected_to case_file_url(CaseFile.last)
  end

  test "should show case_file" do
    get case_file_url(@case_file)
    assert_response :success
  end

  test "should get edit" do
    get edit_case_file_url(@case_file)
    assert_response :success
  end

  test "should update case_file" do
    patch case_file_url(@case_file), params: { case_file: { advocate_id: @case_file.advocate_id, amount_paid: @case_file.amount_paid, appeal_on: @case_file.appeal_on, client_id: @case_file.client_id, convocation_on: @case_file.convocation_on, file_received_on: @case_file.file_received_on, name: @case_file.name, status: @case_file.status } }
    assert_redirected_to case_file_url(@case_file)
  end

  test "should destroy case_file" do
    assert_difference('CaseFile.count', -1) do
      delete case_file_url(@case_file)
    end

    assert_redirected_to case_files_url
  end
end
