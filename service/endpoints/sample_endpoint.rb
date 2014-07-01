class Service::Application
  get "/sample" do
    success_response(hello: "world")
  end
end