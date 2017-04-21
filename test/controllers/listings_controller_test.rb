require 'test_helper'

class ListingsControllerTest < ActionController::TestCase
  setup do
    @listing = listings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:listings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create listing" do
    assert_difference('Listing.count') do
      post :create, listing: { board_id: @listing.board_id, company_id: @listing.company_id, contact_email: @listing.contact_email, employer_id: @listing.employer_id, job_description: @listing.job_description, job_location: @listing.job_location, job_title: @listing.job_title, job_type: @listing.job_type, job_url: @listing.job_url }
    end

    assert_redirected_to listing_path(assigns(:listing))
  end

  test "should show listing" do
    get :show, id: @listing
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @listing
    assert_response :success
  end

  test "should update listing" do
    patch :update, id: @listing, listing: { board_id: @listing.board_id, company_id: @listing.company_id, contact_email: @listing.contact_email, employer_id: @listing.employer_id, job_description: @listing.job_description, job_location: @listing.job_location, job_title: @listing.job_title, job_type: @listing.job_type, job_url: @listing.job_url }
    assert_redirected_to listing_path(assigns(:listing))
  end

  test "should destroy listing" do
    assert_difference('Listing.count', -1) do
      delete :destroy, id: @listing
    end

    assert_redirected_to listings_path
  end
end
