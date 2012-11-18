require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  test "that a status requires content" do 


  	status = Status.new
  	assert !status.save
  	assert !status.errors[:content].empty?
  end
end
