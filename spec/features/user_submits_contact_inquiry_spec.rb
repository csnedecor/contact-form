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
    fill_in "First name", with: "John"
    fill_in "Last name", with: "Smith"

    click_on "Submit"

    expect(page).to have_content "Successfully created inquiry."
  end

  it "gives an error if user inputs invalid information" do
    visit '/inquiries/new'

    click_on "Submit"

    expect(page).to have_content "Email can't be blank"
    expect(page).to have_content "Subject can't be blank"
    expect(page).to have_content "Description can't be blank"
    expect(page).to have_content "First name can't be blank"
    expect(page).to have_content "Last name can't be blank"
  end

  it "displays contact inquiry to admin" do
    visit '/inquiries/new'

    fill_in "Email", with: "test@example.com"
    fill_in "Subject", with: "Great site!"
    fill_in "Description", with: "I love the site, guys. Great job!"
    fill_in "First name", with: "John"
    fill_in "Last name", with: "Smith"

    click_on "Submit"

    visit '/inquiries/new'

    fill_in "Email", with: "another@example.com"
    fill_in "Subject", with: "This stinks."
    fill_in "Description", with: "I hate everything you did here."
    fill_in "First name", with: "Tim"
    fill_in "Last name", with: "Burton"

    click_on "Submit"

    visit '/inquiries'

    expect(page).to have_content "Inquiries"
    expect(page).to have_content "test@example.com"
    expect(page).to have_content "Great site!"
    expect(page).to have_content "I love the site, guys. Great job!"
    expect(page).to have_content "John"
    expect(page).to have_content "Smith"
    expect(page).to have_content "another@example.com"
    expect(page).to have_content "This stinks."
    expect(page).to have_content "I hate everything you did here."
    expect(page).to have_content "Tim"
    expect(page).to have_content "Burton"
  end

  it "allows admins to delete inquiries" do
    visit '/inquiries/new'

    fill_in "Email", with: "test@example.com"
    fill_in "Subject", with: "Great site!"
    fill_in "Description", with: "I love the site, guys. Great job!"
    fill_in "First name", with: "John"
    fill_in "Last name", with: "Smith"

    click_on "Submit"

    visit '/inquiries'

    click_on "Destroy"

    expect(page).not_to have_content "test@example.com"
    expect(page).not_to have_content "Great site!"
    expect(page).not_to have_content "I love the site, guys. Great job!"
    expect(page).not_to have_content "John"
    expect(page).not_to have_content "Smith"
  end
end
