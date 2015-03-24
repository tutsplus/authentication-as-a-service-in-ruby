class App < Sinatra::Base
  configure :test do
    set :raise_errors, true
    set :show_exceptions, false
  end

  get "/" do
    @users = User.all
    haml :index
  end

  get "/login" do
    if ticket_granting_ticket?
      service = Api::Services::Login.new ticket_granting_ticket_name: request.cookies["CASTGC"]
      service.call
      if params[:service]
        redirect params[:service] + "?ticket=#{service.service_ticket.name}", 303
      end
    else
      service = Api::Services::Login.new
      service.call
      @service = params[:service]
      @lt = service.ticket.name
      haml :login
    end
  end

  post "/login" do
    if all_inputs_present?
      service = Api::Services::Login.new(
        username: params[:username],
        password: params[:password],
        login_ticket_name: params[:lt],
        service: params[:service]
      )
      service.call

      if service.status == :ok
        response.set_cookie "CASTGC", value: service.ticket_granting_ticket.name
        if params[:service]
          redirect params[:service] + "?ticket=#{service.service_ticket.name}", 303
        end
      end
    else
      status 422
    end
  end

  get "/users/new" do
    haml :signup
  end

  post "/users" do
    service = Api::Services::Signup.new email: params[:user][:email], password: params[:user][:password]
    service.call

    if service.status == :ok
      redirect "/"
    end
  end

  get "/p3/serviceValidate" do
    service = Api::Services::Validate.new(
      params[:service],
      params[:ticket]
    )
    service.call

    if service.status == :ok
      @user = service.user
      @success = true
    else
      @error = "INVALID_TICKET"
      status 201
    end

    content_type :xml
    builder :serviceValidate
  end

  private

  def all_inputs_present?
    params[:username] && params[:password] && params[:lt] &&
      params[:username] != "" && params[:password] != "" && params[:lt] != ""
  end

  def ticket_granting_ticket?
    !request.cookies["CASTGC"].nil? &&
    TicketGrantingTicket.where(name: request.cookies["CASTGC"]).first
  end
end
