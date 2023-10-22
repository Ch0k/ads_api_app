module Ads
  class CreateService
    include BasicService

    attr_reader :ad

    def initialize(params)
      @ad_params = params[:ad]
      @user = params[:user]
      @errors = []
    end

    def call
      @ad = @user.ads.new(@ad_params)

      fail!(@ad.errors) unless @ad.save
      
      GeocodingJob.perform_later(@ad)
      self
    end
  end
end