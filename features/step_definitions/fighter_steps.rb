Given("a profile {string}") do |file_path|
  @base_url = "#{$env['app_url']}/fighters"
  body = FileReader.instance.read_json(file_path)
  post_response = post(@base_url, body)
  @id = post_response['id']
end

When("the user request it") do
  request_url = "#{@base_url}/#{@id}"
  get_response = get(request_url)
  @response = FileReader.instance.decode_json(get_response)
end

Then("the response should have fighter with first name {string} in the body") do |name|
  expect(@response['first_name']).to eq(name)
end
