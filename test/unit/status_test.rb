require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  
  test "A status requires content." do
    status = Status.new
    assert !status.save
    assert !status.errors[:content].empty?
    assert status.errors[:content].include?("can't be blank")
  end

  test 'A status contents must be longer than 2 characters' do
    status = Status.new
    status.content = "u2"
    assert !status.save
    assert !status.errors[:content].empty?
    assert status.errors[:content].include?('is too short (minimum is 3 characters)')
  end

  test 'A status must belong to a user' do
    status = Status.new(content: 'Howdy!')
    assert !status.save
    assert !status.errors[:user_id].empty?
    puts status.errors[:user_id].include?("can't be blank")
  end

end
