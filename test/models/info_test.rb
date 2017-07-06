require 'test_helper'

class InfoTest < ActiveSupport::TestCase
  
	def setup
		@info = Info.new(title: "Hello Excalibur", content: "Ruby on Rails CMS")
	end

	test "should be valid" do
		assert @info.valid?
	end

	test "title should be present" do
		@info.title = " "
		assert_not @info.valid?
	end

	test "content should be present" do
		@info.content = " "
		assert_not @info.valid?
	end

	test "order should be three first" do
		assert_equal infos(:three), Info.first
	end

end
