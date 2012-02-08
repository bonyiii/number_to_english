require 'spec_helper'

describe Convert do
  
  it "should convert 19 to nineteen" do
    c = Convert.new
    c.arabic = 19
    c.to_english(c.arabic).should == "nineteen"
  end
  
  it "should convert 45 to forty five" do
    c = Convert.new
    c.arabic = 45
    c.to_english(c.arabic).should == "forty five"
  end
  
  it "should convert 145 to one hundred forty five" do
    c = Convert.new
    c.arabic = 145
    c.to_english(c.arabic).should == "one hundred forty five"
  end
  
  it "should convert 0 to zero" do
    c = Convert.new
    c.arabic = 0
    c.to_english(c.arabic).should == "zero"
  end
  
  it "should convert 1542 to one thousand five hundred forty two" do
    c = Convert.new
    c.arabic = 1542
    c.to_english(c.arabic).should == "one thousand five hundred forty two"
  end
  
  it "should convert 2 000 542 to one thousand five hundred forty two" do
    c = Convert.new
    c.arabic = 2000542
    c.to_english(c.arabic).should == "two million five hundred forty two"
  end 
  
    it "should convert - 2 000 542 to minus two million five hundred forty two" do
    c = Convert.new
    c.arabic = -2000542
    c.to_english(c.arabic).should == "minus two million five hundred forty two"
  end   
end
