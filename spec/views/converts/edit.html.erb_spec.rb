require 'spec_helper'

describe "converts/edit" do
  before(:each) do
    @convert = assign(:convert, stub_model(Convert))
  end

  it "renders the edit convert form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => converts_path(@convert), :method => "post" do
    end
  end
end
