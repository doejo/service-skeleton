require "spec_helper"

describe "Sample endpoint" do
  before do
    get "/sample"
  end

  it "is successful" do
    expect(last_response.status).to eq 200
    expect(json_body).to eq ({ "hello" => "world" })
  end
end