require 'rails_helper'

RSpec.describe "inquiries/index", :type => :view do
  before(:each) do
    assign(:inquiries, [
      Inquiry.create!(
        :email => "Email",
        :subject => "Subject",
        :description => "MyText",
        :first_name => "First Name",
        :last_name => "Last Name"
      ),
      Inquiry.create!(
        :email => "Email",
        :subject => "Subject",
        :description => "MyText",
        :first_name => "First Name",
        :last_name => "Last Name"
      )
    ])
  end

  it "renders a list of inquiries" do
    render
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
  end
end
