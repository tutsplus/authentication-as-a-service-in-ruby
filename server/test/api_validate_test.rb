require "test_helper"
require "api/app/app"

describe App do
  include Rack::Test::Methods

  let(:app) { App }
  let(:user) { spawn_user email: "me@example.com", password: "password" }
  let(:service) { "https://app.example.com" }

  before do
    clear_cookies
    perform_login user: user, service: service
  end

  it "validates a service ticket for a service" do
    get "/p3/serviceValidate", service: service, ticket: @service_ticket
    last_response.status.must_equal 200
  end

  it "returns an XML response" do
    get "/p3/serviceValidate", service: service, ticket: @service_ticket
    last_response.content_type.must_match %r{application/xml}
  end

end

