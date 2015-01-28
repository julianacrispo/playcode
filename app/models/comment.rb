class Comment < ActiveRecord::Base
  belongs_to :user #dependent destroy?
  belongs_to :commentable, polymorphic: true

  # order by most recent
  default_scope { order('updated_at DESC') }
end
