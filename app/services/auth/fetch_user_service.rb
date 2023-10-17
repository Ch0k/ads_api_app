module Auth
  class FetchUserService
    include BasicService

    attr_reader :user

    def initialize(uuid)
      @uuid = uuid
      @errors = []
    end

    def call
      return fail!(I18n.t(:forbidden, scope: 'services.auth.fetch_user_service')) if @uuid.blank? || session.blank?
      @user = session.user
      self
    end

    private

    def session
      @session ||= UserSession.find_by(uuid: @uuid)
    end
  end
end
