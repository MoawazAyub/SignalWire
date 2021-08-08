# frozen_string_literal: true

module Webhooks
  # this class dispatching tags to webhook
  class DispatchTags
    require 'uri'
    require 'net/http'
    attr_accessor :body

    def initialize(body)
      @body = body
    end

    def call
      send_tags
    end

    private

    def url
      URI('https://webhook.site/7f5f6ff3-923c-41e1-b3e1-d47d1cb0a2b7')
    end

    def send_tags
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Post.new(url, { 'Content-Type' => 'application/json' })
      request.body = body.to_json
      http.request(request)
    end
  end
end
