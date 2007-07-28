require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe "A character class" do
  testing_expression "[A-Z]"

  it "matches single characters within that range" do
    parse('A').should be_success
    parse('N').should be_success
    parse('Z').should be_success
  end
  
  it "does not match single characters outside of that range" do
    parse('8').should be_failure
    parse('a').should be_failure
  end
  
  it "matches a single character within that range at index 1" do
    parse(' A', :at_index => 1).should be_success
  end
  
  it "fails to match a single character out of that range at index 1" do
    parse(' 1', :at_index => 1).should be_failure
  end
end

describe "A character class containing quotes" do
  testing_expression "[\"']"
  
  it "matches a quote" do
    parse("'").should be_success
  end
  
  it "matches a double-quote" do
    parse('"').should be_success
  end
end