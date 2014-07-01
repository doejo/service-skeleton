module ResponseHelper
  def json_body
    JSON.parse(last_response.body)
  end

  def json_error
    json_body["error"]
  end
end