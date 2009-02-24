require File.dirname(__FILE__) + '/test_helper.rb'

class TestDailyObservtion < Test::Unit::TestCase

  def setup
    super
    weather = Weather.find_location("9770")
    country = weather.countries.first
    location = country.locations.first
    @daily_observation = location.daily_observations.first
  end
  
  def test_should_be_a_daily_observation
    assert_kind_of DailyObservation, @daily_observation
  end

  def test_should_not_have_nil_attributes
    [:day_name, :date, :temp_min_c, :rainfall_mm].each do |attr_name|
      assert_not_nil @daily_observation.send(attr_name), "@daily_observation should respond to #{attr_name}"
    end
  end

end