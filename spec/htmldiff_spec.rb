require File.dirname(__FILE__) + '/spec_helper'
require 'htmldiff'

describe "htmldiff" do
  
  it "should diff text" do
    
    diff = HTMLDiff.diff('a word is here', 'a nother word is there')
    diff.should == "a<ins class=\"diffins\"> nother</ins> word is <del class=\"diffmod\">here</del><ins class=\"diffmod\">there</ins>"
    
  end
  
  it "should insert a letter and a space" do
    diff = HTMLDiff.diff('a c', 'a b c')
    diff.should == "a <ins class=\"diffins\">b </ins>c"
  end
  
  it "should remove a letter and a space" do
    diff = HTMLDiff.diff('a b c', 'a c')
    diff.should == "a <del class=\"diffdel\">b </del>c"
  end
  
  it "should change a letter" do
    diff = HTMLDiff.diff('a b c', 'a d c')
    diff.should == "a <del class=\"diffmod\">b</del><ins class=\"diffmod\">d</ins> c"
  end
  
  it "should change a *" do
    diff = HTMLDiff.diff('a _ c', 'a * c')
    diff.should == "a <del class=\"diffmod\">_</del><ins class=\"diffmod\">*</ins> c"
  end
  
  it "should change a ." do
    diff = HTMLDiff.diff('a b c', 'a b c .')
    diff.should == "a b c<ins class=\"diffins\"> .</ins>"
  end
  
    it "should change line break" do
        diff = HTMLDiff.diff("once upon a time \n there was a break ", "once upon a time there was a break ")
        diff.should == "once upon a time there was a break "
    end
  
end