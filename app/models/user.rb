class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :skills
  has_many :posts
  has_many :comments
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "default_avatar.png"

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  validates_with AttachmentSizeValidator, :attributes => :avatar, :less_than => 1.megabytes

end
