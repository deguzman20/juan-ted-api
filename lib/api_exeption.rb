# Library for api error / exception output.
class ApiException < StandardError
  attr_reader :http_status, :error

  def initialize(options)
    super()
    options = options.with_indifferent_access
    @http_status = error[:http_status]

    @error = Error.new(
      code: options[:code],
      message: options[:message],
      debug_info: options[:debug_info]
    )
  end

  # Base class for error on setting the
  # exception error.
  class Error
    attr_reader :code, :message, :debug_info

    def initialize(*_args)
      options = (options.first || {}).with_indifferent_access
      @code = options[:code]
      @message = options[:message]
      @debug_info = options[:debug_info] || ""
    end
  end
end
