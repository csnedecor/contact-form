require 'rails_helper'

RSpec.describe "inquiries/show", :type => :view do
  before(:each) do
    @inquiry = assign(:inquiry, Inquiry.create!(
      :email => "Email",
      :subject => "Subject",
      :description => "MyText",
      :first_name => "First Name",
      :last_name => "Last Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Subject/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
  end
end
