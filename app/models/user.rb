class User < ActiveRecord::Base
  # attr_accessor :name, :email

  # call back before_save to downcase the emails Ensuring email uniqueness by downcasing
  # the email attribute before being saved to database
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false}

  has_secure_password
  validates :password, length: { minimum: 6 }

  end















