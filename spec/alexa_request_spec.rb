require 'alexa/request'

RSpec.describe Alexa::Request do
  describe '#slot_value' do 
    it 'returns the value for a specified slot' do
      request_json = {
        "request" => {
          "type" => "IntentRequest",
          "intent" => {
            "name" => "IntentName",
            "slots" => {
              "SlotName" => {
                "name" => "SlotName",
                "value" => "10"
              }
            }
          }
        }
      }.to_json
      
      sinatra_request = double("Sinatra::Request", body: StringIO.new(request_json))
      expect(Alexa::Request.new(sinatra_request).slot_value("SlotName")).to eq "10"
    end
  end

  describe '#session_attribute' do
    it 'returns true if this is a new session' do
      request_json = {
        "session" => {
          "sessionId" => "id_string",
          "attributes" => {
            "movieTitle" => "Titanic"
          }
        }
      }.to_json

      sinatra_request = double("Sinatra::Request", body: StringIO.new(request_json))
      expect(Alexa::Request.new(sinatra_request).session_attribute("movieTitle")).to eq "Titanic"
    end
  end

  describe '#intent_name' do
    it 'returns the Intent Name from the request' do
      request_json = {
        "request" => {
          "type" => "IntentRequest",
          "intent" => {
            "name" => "IntentName"
          }
        }
      }.to_json

      sinatra_request = double("Sinatra::Request", body: StringIO.new(request_json))
      expect(Alexa::Request.new(sinatra_request).intent_name).to eq "IntentName"
    end
  end
end