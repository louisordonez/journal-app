require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test 'should not save category without name' do
    category = Category.new
    assert_not category.save, 'saved the category without name'
  end

  test 'should not save category if name is less than 2 characters' do
    category = Category.new
    category.name = 'C'
    assert_not category.save, 'saved the category with name less than 2 characters'
  end
end
