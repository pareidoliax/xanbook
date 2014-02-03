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
    user.profile_name = users(:alisa).profile_name

    assert !user.save
    assert !user.errors[:profile_name].empty?    
  end

  test "a user's profile name without spaces" do
    user = User.new(first_name: "Riho", last_name: "Nishimura", email: 'wife@example.com')
    user.password  = user.password_confirmation = 'helloworld'
    user.profile_name = "My Spaced Out Profile Name"

    assert !user.save
    assert !user.errors[:profile_name].empty?
    assert user.errors[:profile_name].include?("Must be formatted correctly.")
  end

  test "a user can have a valid profile_name" do
    user = User.new(first_name: "Riho", last_name: "Nishimura", email: 'wife@example.com')
    user.password  = user.password_confirmation = 'helloworld'
    user.profile_name = "userAwesome"

    assert user.valid?
    assert user.save
    assert user.errors[:profile_name].empty?
  end

end
