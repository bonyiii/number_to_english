require 'spec_helper'

describe "converts/show" do
  before(:each) do
    @convert = assign(:convert, stub_model(Convert))
  end

  it "renders attributes in <p>" do
    render
  end
end
