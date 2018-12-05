Given("that the fighter {string} is in the database") do |filename|
  @base_url = "#{$env['app_url']}/fighters"
  body = FileReader.instance.read_json(filename)
  response = post(@base_url, body)
  @request_url = "#{@base_url}/#{response['id']}"
end

When("the user requests it by id") do
  @response = get(@request_url)
end

When("the user deletes it") do
  delete(@request_url)
end

When ("the user patches with {string}") do |filename|
  body = FileReader.instance.read_json(filename)
  @response = patch(@request_url, body)
end

Then("the response should have {string} with {string} in the body") do |property, value|
  expect(@response[property]).to eq(value)
end

Then("it should not be in the database anymore") do
  expect {raise "Fighter not found"}.to raise_error
end
