module Response
  def success_json(object, status = :ok)
    render json: object, status: status
  end

  def error_json(message, status = :ok)
    render json: { errors: message }, status: status
  end
end
