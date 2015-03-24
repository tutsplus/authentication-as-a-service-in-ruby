module Api::Services
  class Signup
    attr_reader :email, :user, :status

    def initialize email: "me@example.com", password: "blank_password"
      @email = email
      @password = password
    end

    def call
      @user = User.new email: @email
      @user.encrypted_password = Digest::SHA1.hexdigest @password
      if @user.save
        @status = :ok
      end
    end
  end
end
