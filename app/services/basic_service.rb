module BasicService
  def success?
    !failure?
  end

  def failure?
    @errors.any?
  end

  private

  def fail!(errors)
    @errors += Array(errors)
  end
end