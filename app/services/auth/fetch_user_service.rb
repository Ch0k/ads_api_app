module Auth
  class FetchUserService
    prepend BasicService

    attr_reader :user

    def initialize(uuid)
      @uuid = uuid
    end

    def call
      return fail!(I18n.t(:forbidden, scope: 'services.auth.fetch_user_service')) if @uuid.blank? || session.blank?
      @user = session.user
    end

    private

    def session
      @session ||= UserSession.find_by(uuid: @uuid)
    end
  end
end
