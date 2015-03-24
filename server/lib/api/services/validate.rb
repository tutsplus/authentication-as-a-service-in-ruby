module Api::Services
  class Validate
    attr_reader :status, :user

    def initialize service, service_ticket_name
      @service = service
      @service_ticket_name = service_ticket_name
    end

    def call
      if service_found?
        @status = :ok
        @user = @service_ticket.user
      end
    end

    private

    def service_found?
      @service_ticket = ServiceTicket.where(name: @service_ticket_name, service: @service).first
    end
  end
end
