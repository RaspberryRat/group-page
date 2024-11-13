class Post < ApplicationRecord
  has_rich_text :content

  belongs_to :user
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  has_many :activities

  before_destroy :nullify_post_activities
  after_create :log_creation
  after_update :log_update

  validates :title, presence: true, length: { minimum: 5 }

  def post_date
    return self.created_at if self.date.nil?

    self.date
  end


  private

  def log_creation
    activities.create(user: user, action: 'created', timestamp: Time.current)
  end

  def log_update
    activities.create(user: user, action: 'updated', timestamp: Time.current)
  end

  def nullify_post_activities
    activities.update_all(post_id: nil)
  end
end
