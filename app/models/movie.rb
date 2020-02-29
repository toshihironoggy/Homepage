class Movie < ApplicationRecord
    acts_as_taggable
    acts_as_taggable_on :movie_tags
end
