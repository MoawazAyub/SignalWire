# frozen_string_literal: true

module TagsValidator
  # this class handles validation for tags controller
  class Tags
    include ActiveModel::Validations

    attr_accessor :user_id, :title, :tags

    validates :user_id, presence: true, numericality: true
    validates :title, presence: true
    validate :tag_length

    def initialize(params = {})
      @user_id = params[:user_id]
      @title = params[:title]
      @tags = params[:tags]
      params.permit(:user_id, :title, tags: [])
    end

    private

    def tag_length
      if !tags.is_a?(Array)
        errors.add(:tags, 'tags should be in array format')
      elsif tags.length > 4
        errors.add(:tags, 'tags should be less than five')
      end
    end
  end
end
