class User < ApplicationRecord
    has_many :products
    validates :name, presence: true
    has_many :posts, dependent: :destroy
    # validates :email, presence: true, uniqueness: true
    # validates :password, presence: true, length: { minimum: 6 }
    has_many :posts, dependent: :destroy
    validate :password_validation
    validate :gmail_domain_validation
    validate :unique_email



    def gmail_domain_validation
        return if email.blank?
        domain = email.split('@').last
        unless domain == 'gmail.com'
            errors.add(:email, 'must be a Gmail address')
        end
    end
    def unique_email
        byebug
        if User.exists?(email: email)
            errors.add(:email, 'has already been taken')
        end
    end


    
    def password_validation
        if password.present? && password.length<8
            errors.add(:password, 'must be at least 8 characters long')
        end
    end
    
    def custom_password_validation
        return if password.blank? # Skip validation if password is blank
        unless contains_number?(password) && contains_character?(password) && contains_special_symbol?(password) && contains_number(password)
            errors.add(:password, 'must contain at least one number, one character, and one special symbol')
        end
    end
    
    def contains_number?(password)
        password.match?(/\d/)
    end
    
    def contains_character?(password)
        password.match?(/[a-zA-Z]/)
    end
    
    def contains_special_symbol?(password)
        password.match?(/[!@#$%^&*()]/)
    end

    def contains_number(password)
        password.match?([/0123445566789/])
    end
end
