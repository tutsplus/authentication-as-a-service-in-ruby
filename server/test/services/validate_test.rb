require "test_helper"

module Api::Services
  describe Validate do
    let(:service) { "https://app.example.com" }
    let(:user) { spawn_user }
    let(:service_ticket) { spawn_service_ticket service: service, user: user }
    let(:validate_service) { Validate.new(service, service_ticket.name) }

    before do
      validate_service.call
    end

    it "validates a service ticket against a service" do
      validate_service.status.must_equal :ok
    end

    it "returns the user's info on successful validation" do
      validate_service.user.must_be_kind_of User
    end
  end
end

