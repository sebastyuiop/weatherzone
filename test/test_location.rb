require File.dirname(__FILE__) + '/test_helper.rb'

require 'weatherzone/resources/location.rb'

class TestLocation < Test::Unit::TestCase

  def setup
    create_connection
    @locations = Location.find("9770")
    @location  = @locations.first
  end
  
  def test_should_exist
    assert @location
  end
  
  def test_should_have_attributes
    ["type", "code", "name", "state"].each do |a|
      assert @location[a]
    end
  end

  def test_should_be_identifiable_by_code
    assert_equal @location.id, @location["code"]
  end

  def test_should_have_forecasts
    assert @location.forecasts.any?
  end

  def test_should_have_conditions
    assert @location.conditions
  end

end