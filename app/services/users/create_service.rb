module Users
  class CreateService
    include BasicService

    attr_reader :user

    def initialize(name, email, password)
      @name = name
      @email = email
      @password = password
      @errors = []
    end

    def call
      @user = User.new(
        name: @name,
        email: @email,
        password: @password
      )

      fail!(@user.errors) unless @user.save
      self
    end
  end
end