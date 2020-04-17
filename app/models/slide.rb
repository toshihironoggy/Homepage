class Slide < ApplicationRecord
  acts_as_taggable
  acts_as_taggable_on :slide_tags
end
