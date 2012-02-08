require 'spec_helper'

shared_examples_for "ActiveModel" do
  include ActiveModel::Lint::Tests
  # to_s is to support ruby-1.9
  ActiveModel::Lint::Tests.public_instance_methods.map{|m| m.to_s}.grep(/^test/).each do |m|
    example m.gsub('_',' ') do
      send m
    end
  end

  def model
    subject
  end
end

describe Convert do
  
  it_should_behave_like "ActiveModel"

  it "should convert 19 to nineteen" do
    c = Convert.new
    c.number = 19
    #c.to_english(c.arabic).should == "nineteen"
    c.number.to_words.should == "nineteen"
  end

  it "should convert 45 to forty five" do
    c = Convert.new
    c.number = 45
    c.number.to_words.should == "forty five"
  end

  it "should convert 145 to one hundred forty five" do
    c = Convert.new
    c.number = 145
    c.number.to_words.should == "one hundred forty five"
  end

  it "should convert 0 to zero" do
    c = Convert.new
    c.number = 0
    c.number.to_words.should == "zero"
  end

  it "should convert 1542 to one thousand five hundred forty two" do
    c = Convert.new
    c.number = 1542
    c.number.to_words.should == "one thousand five hundred forty two"
  end

  it "should convert 2 000 542 to one thousand five hundred forty two" do
    c = Convert.new
    c.number = 2000542
    c.number.to_words.should == "two million five hundred forty two"
  end

  it "should convert - 2 000 542 to minus two million five hundred forty two" do
    c = Convert.new
    c.number = -2000542
    c.number.to_words.should == "minus two million five hundred forty two"
  end
end
