module Users
  class CreateService
    prepend BasicService

    attr_reader :user

    def initialize(name, email, password)
      @name = name
      @email = email
      @password = password
    end

    def call
      @user = User.new(
        name: @name,
        email: @email,
        password: @password
      )

      fail!(@user.errors) unless @user.save
    end
  end
end