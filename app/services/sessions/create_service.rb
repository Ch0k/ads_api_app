module Sessions
  class CreateService

    attr_reader :session

    def initialize(email, password)
      @password = password
      @user = User.find_by(email: email)
      @errors = []
    end

    def call
      validate
      
      create_session unless failure?
      self
    end

    def success?
      !failure?
    end

    def failure?
      @errors.any?
    end

    private

    def create_session
      @session = @user.sessions.new
      fail!(@session.errors) unless @session.save
    end

    def validate
      return fail_t!(:unauthorized) unless @user&.authenticate(@password)
    end

    def fail!(errors)
      @errors += Array(errors)
    end

    def fail_t!(key)
      fail!(I18n.t(key, scope: 'services.user_sessions.create_service'))
    end
  end
end