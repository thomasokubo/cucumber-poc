require 'singleton'
require 'json'

class FileReader
  include Singleton

  def read_file(filename)
    return File.read("features/resources/#{filename}")
  end

  def decode_json(json_object)
    return JSON.parse(json_object)
  end

  def read_json(filename)
    file_content = read_file(filename)
    return decode_json(file_content)
  end
end
