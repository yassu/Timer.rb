#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'test/unit'
require './src/timer.rb'

class Test_append_multiple_prefix < Test::Unit::TestCase
  def test1
    assert_equal(append_multiple_prefix(0, 'second'), '0 second')
  end

  def test2
    assert_equal(append_multiple_prefix(1, 'second'), '1 second')
  end

  def test3
    assert_equal(append_multiple_prefix(2, 'second'), '2 seconds')
  end
end

class Test_get_datedelta_format < Test::Unit::TestCase

  def test1
    assert_equal(get_datedelta_format(0, 0, 0), '0 second')
  end

  def test2
    assert_equal(get_datedelta_format(0, 0, 1), '1 hour')
  end

  def test3
    assert_equal(get_datedelta_format(0, 2, 0), '2 minutes')
  end

  def test4
    assert_equal(get_datedelta_format(0, 2, 1), '1 hour and 2 minutes')
  end

  def test5
    assert_equal(get_datedelta_format(3, 0, 0), '3 seconds')
  end

  def test6
    assert_equal(get_datedelta_format(3, 0, 1), '1 hour and 3 seconds')
  end

  def test7
    assert_equal(get_datedelta_format(3, 2, 0), '2 minutes and 3 seconds')
  end

  def test8
    assert_equal(get_datedelta_format(3, 2, 1), '1 hour, 2 minutes and 3 seconds')
  end
end
