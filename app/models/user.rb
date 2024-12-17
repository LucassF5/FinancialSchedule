class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validate :password_complexity

  validates :email,
            presence: true,
            uniqueness: true
  validates :username,
            presence: true,
            length: { in: 3..100 },
            format: {
                     with: /\A[a-zA-Z]+\Z/,
                     message: "somente permite letras, sem números e caracteres especiais"
                     }
  validates :password,
            format: {
              with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{9,}\z/,
            message: "deve ter no mínimo 9 caracteres, incluir uma letra maiúscula, um número e um caractere especial."
           }

  private

  def password_complexity
    return if password.blank?
    if password.length < 9
      errors.add(:password, "deve ter no mínimo 9 caracteres")
    end

    unless password.match?(/[a-z]/)
      errors.add(:password, "deve incluir uma letra minúscula")
    end

    unless password.match?(/[A-Z]/)
      errors.add(:password, "deve incluir uma letra maiúscula")
    end

    unless password.match?(/\d/)
      errors.add(:password, "deve incluir um número")
    end

    unless password.match?(/[@$!%*?&]/)
      errors.add(:password, "deve incluir um caractere especial")
    end
  end
end
