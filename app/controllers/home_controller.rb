require 'net/https'

class HomeController < ApplicationController
  def index
    @posts = 10.times.map do
      {
        user: current_user,
        posted_at: '10分前',
        extension: 'md',
        url: 'https://github.com/ogihara-ryo/til_test/blob/master/ruby/test.md',
        raw: raw
      }
    end
  end

  private

  def raw
    url = URI.parse('https://raw.githubusercontent.com/ogihara-ryo/til_test/master/ruby/test.md')
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true
    https.verify_mode = OpenSSL::SSL::VERIFY_NONE
    https.start
    https.get(url.path).body
  end
end
