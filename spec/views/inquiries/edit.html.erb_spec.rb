require 'rails_helper'

RSpec.describe "inquiries/edit", :type => :view do
  before(:each) do
    @inquiry = assign(:inquiry, Inquiry.create!(
      :email => "MyString",
      :subject => "MyString",
      :description => "MyText",
      :first_name => "MyString",
      :last_name => "MyString"
    ))
  end

  it "renders the edit inquiry form" do
    render

    assert_select "form[action=?][method=?]", inquiry_path(@inquiry), "post" do

      assert_select "input#inquiry_email[name=?]", "inquiry[email]"

      assert_select "input#inquiry_subject[name=?]", "inquiry[subject]"

      assert_select "textarea#inquiry_description[name=?]", "inquiry[description]"

      assert_select "input#inquiry_first_name[name=?]", "inquiry[first_name]"

      assert_select "input#inquiry_last_name[name=?]", "inquiry[last_name]"
    end
  end
end
