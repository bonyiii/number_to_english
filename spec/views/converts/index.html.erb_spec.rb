require 'spec_helper'

describe "converts/index" do
  before(:each) do
    assign(:converts, [
      stub_model(Convert),
      stub_model(Convert)
    ])
  end

  it "renders a list of converts" do
    render
  end
end
