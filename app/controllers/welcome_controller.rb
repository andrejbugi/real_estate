class WelcomeController < ApplicationController
  attr_accessor :parse_page

  def index
    doc = HTTParty.get("https://weather4all.com.mk/vremenska-prognoza/Skopje")
    @parse_page ||= Nokogiri::HTML(doc.body)

    weather = get_weather.join(' ').split
    last = weather.last
    last4 = weather.pop && weather.last(3).join(' ')
    # third = weather[3]
    @show_weather = weather.first + ' ' + last + ', ' + last4
  end

  def get_weather
    parse_page.css("#city_info").css("span").children.map { |info| info.text }.compact
  end
end
