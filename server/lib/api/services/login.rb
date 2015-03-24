module Api::Services
  class Login
    attr_reader :ticket, :ticket_granting_ticket, :service_ticket, :status

    def initialize username: nil, password: nil, login_ticket_name: nil, service: nil, ticket_granting_ticket_name: nil
      @username = username
      @password = password
      @login_ticket_name = login_ticket_name
      @service = service
      @ticket_granting_ticket_name = ticket_granting_ticket_name
    end

    def call
      if @username.nil? && @ticket_granting_ticket_name.nil?
        generate_login_ticket
      else
        login
      end

    end

    private

    def generate_login_ticket
      @ticket = LoginTicket.new name: "LT-#{Digest::SHA1.hexdigest(Time.new.to_s)}"
      @ticket.save
    end

    def login
      if valid_auth?
        generate_ticket_granting_ticket
        generate_service_ticket

        @status = :ok
      end

      expire_login_ticket if @login_ticket_name
    end

    def valid_auth?
      if @ticket_granting_ticket_name.nil?
        @user = User.where(email: @username, encrypted_password: Digest::SHA1.hexdigest(@password)).first
      else
        @ticket_granting_ticket = TicketGrantingTicket.where(name: @ticket_granting_ticket_name).first
        if @ticket_granting_ticket
          @user = @ticket_granting_ticket.user
        else
          return false
        end
      end
    end

    def expire_login_ticket
      LoginTicket.where(name: @login_ticket_name).first.update_attribute(:active, false)
    end

    def generate_ticket_granting_ticket
      @ticket_granting_ticket = TicketGrantingTicket.new name: "TGT-" + Digest::SHA1.hexdigest(Time.new.to_s), user: @user
      @ticket_granting_ticket.save
    end

    def generate_service_ticket
      @service_ticket = ServiceTicket.new name: "ST-" + Digest::SHA1.hexdigest(Time.new.to_s), service: @service, user: @user
      @service_ticket.save
    end
  end
end
