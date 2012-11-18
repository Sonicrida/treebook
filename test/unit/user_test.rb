require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "a user should enter a first name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:first_name].empty?
  end

  test "a user should enter a last name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:last_name].empty?
  end

  test "a user should enter a profile name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "a user should have a unique profile name" do
  	user = User.new
	  user.profile_name = users(:jonathan).profile_name

  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "a user should have a profile name with no spaces" do
    user = User.new(first_name: 'Jonathan', last_name: 'Chhabra', email: 'Sonicrida2@gmail.com')
    user.password = user.password_confirmation = 'asaasas'
    user.profile_name = "My Profile With Spaces"

    assert !user.save
    assert !user.errors[:profile_name].empty?
    assert user.errors[:profile_name].include?("Must be formatted correctly.")
  end

  test "a user can have a correctly formatted name" do
    user = User.new(first_name: 'Jonathan', last_name: 'Chhabra', email: 'Sonicrida2@gmail.com')
    user.password = user.password_confirmation = 'asaasas'

    user.profile_name = 'legitusername'
    assert user.valid?
  end

end
