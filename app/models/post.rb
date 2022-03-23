class Post < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader

  validates :name,  :presence => true
  validates :title, :presence => true, :length => { minimum: 5 }

  belongs_to :user
  has_many :comments, :dependent => :destroy
  has_many :tags, :dependent => :destroy
  has_many :likes, :dependent => :destroy

  after_destroy :log_destroy_action
  accepts_nested_attributes_for :tags, :allow_destroy => true, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  # impression
  is_impressionable
  def impression_count
    impressions.size
  end

  def unique_impression_count
    impressions.group(:ip_address).size.keys.length
  end

  private
  def log_destroy_action
    puts 'Posts are also destroyed'
  end
end
