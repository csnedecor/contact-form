require 'spec_helper'
require 'rails_helper'

feature "User submits contact inquiry" do
  # As a site visitor
  # I want to contact the site's staff
  # So that I can tell them how awesome they are
  #
  # Acceptance Criteria:
  # * I must specify a valid email address
  # * I must specify a subject
  # * I must specify a description
  # * I must specify a first name
  # * I must specify a last name

  it "creates a valid inquiry" do
    visit '/inquiries/new'

    fill_in "Email", with: "test@example.com"
    fill_in "Subject", with: "Great site!"
    fill_in "Description", with: "I love the site, guys. Great job!"
    fill_in "First Name", with: "John"
    fill_in "Last Name", with: "Smith"

    click_on "Submit"

    expect(page).to have_content "Successfully created inquiry."
  end
end
