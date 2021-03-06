require_relative './handlers'

module Alexa
  class Skill
    @@intents = {}

    def self.register_intents
      Dir.glob("intents/*.rb").each {|intent_declaration| register(intent_declaration)}
    end

    def self.register(intent_declaration)
      Alexa::Handlers.class_eval File.open(File.expand_path(intent_declaration)).read
    end
  end
end

Alexa::Skill.register_intents
