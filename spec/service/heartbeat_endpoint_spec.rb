require "spec_helper"

describe "Heartbeat endpoint" do
  before do
    get "/heartbeat"
  end

  it "is successful" do
    expect(last_response.status).to eq 200
    expect(last_response.body).to eq "OK"
  end
end