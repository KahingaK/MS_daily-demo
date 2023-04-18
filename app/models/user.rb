class User < ApplicationRecord
    has_many :posts
    has_many :subscriptions
    has_many :categories, through: :subscriptions

    #Relationships
    has_one :profile
    # roles
    enum role: [:technicalwriter, :moderator, :admin]
    # Helper method to encrypt password
    has_secure_password
    # Validations
    validates :email, presence: true, uniqueness: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP} # checks if the email attribute of a model matches a valid email format
    validates :username, presence: true, uniqueness: true
    validates :password, length: { minimum: 6}, if: -> {new_record? || !password.nil?}
end

end
