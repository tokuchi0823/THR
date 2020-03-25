class User < ApplicationRecord
  has_many :attendances, dependent: :destroy
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "user_id",
                                  dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :sankas, dependent: :destroy
  attr_accessor :remember_token
  before_save { self.email = email.downcase }
  
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 100 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  has_secure_password
  validates :department, length: { in: 2..50 }, allow_blank: true
  validates :basic_time, presence: true
  validates :work_time, presence: true
  #validates :displacement, presence: true
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  
  def forget
    update_attribute(:remember_digest, nil)
  end
  
  def User.search(search)
      return User.all unless search
      User.where(['name LIKE ?', "%#{search}%"])
  end
end
