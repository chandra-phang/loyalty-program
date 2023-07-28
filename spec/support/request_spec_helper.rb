module RequestSpecHelper
  def response_body
    JSON.parse(response.body, symbolize_names: true)
  end

  def format_datetime(datetime)
    datetime.strftime('%Y-%m-%d %H:%M:%S')
  end
end
