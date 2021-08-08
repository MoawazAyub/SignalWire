# frozen_string_literal: true

module Api
  # class for handling tags
  class TagsController < ApplicationController
    skip_forgery_protection
    before_action :validate_params

    def create
      Ticket.create(filter_params)
      Tags::AddTags.new(params[:tags]).call
      Webhooks::DispatchTags.new({ trending_tag: Tag.order('tag_count DESC').first.tag_title }).call

      render json: { success: 'Records created successfully' }, status: 200
    end

    private

    def filter_params
      params.permit(:user_id, :title)
    end

    def validate_params
      validated_params = TagsValidator::Tags.new(params)
      return if validated_params.valid?

      render json: { error: validated_params.errors }, status: 422 and return
    end
  end
end
