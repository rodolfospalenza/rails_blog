require 'test_helper'

class SimpleSearchTest < ActiveSupport::TestCase
  test "search method is available" do
    assert Article.respond_to?(:search)
  end
  
  test "should search" do
    assert_equal 1, Article.search("framewrok").size
    assert_equal 0, Article.search("unknown").size
  end
end
