# frozen_string_literal: true

module Api
  # class for handling tags
  class TagsController < ApplicationController
    skip_forgery_protection

    def create
      render json: {hello: true}
    end
  end
end
