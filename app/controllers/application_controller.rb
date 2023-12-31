# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session, if: :json_request

  include Response

  rescue_from StandardError do |e|
    error_json(e, 422)
  end

  def json_request
    request.format == 'application/json'
  end
end
