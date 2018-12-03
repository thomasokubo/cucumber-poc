require 'httparty'

def get(url)
  response = HTTParty.get(url)
  expect(response.code).to eq(200)
  return response.body
end

def post(url, body)
  response = HTTParty.post(url, :headers => create_headers, :body => body.to_json)
  expect(response.code).to eq(200)
  return response.body
end

def delete(url)
  response = HTTParty.delete(url)
  expect(response.code).to eq(200)
  return response.body
end

def create_headers
  return {
    'Content-Type' => 'application/vnd.api+json'
  }
end
