require 'singleton'

class HealthChecker
  include Singleton

  def check_health
    HTTParty::Basement.default_options.update(verify: false)
    check_webapp_health()
  end

  def check_webapp_health
    begin
      Timeout::timeout(5) {
        response = HTTParty.get("#{$env['app_url']}/swagger-ui.html#/")
        if(response.code != 200)
          fail 'Webapp is unhealthy'
        end
      }
    rescue => error
      puts 'Error on Webapp'
      fail error
    end
    puts 'Webapp is healthy'
  end

end
