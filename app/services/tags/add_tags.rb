# frozen_string_literal: true

module Tags
  # this class handles addition of tags
  class AddTags
    attr_accessor :tags

    def initialize(tags)
      @tags = tags
    end

    def call
      handle_tags
    end

    private

    def handle_tags
      tags.each do |tag_title|
        tag = Tag.find_by(tag_title: tag_title.downcase)
        if !tag
          Tag.create(tag_title: tag_title.downcase, tag_count: 0)
        else
          tag.increment!(:tag_count)
        end
      end
    end
  end
end
