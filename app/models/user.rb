class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email,
            presence: true,
            uniqueness: true
  validates :username,
            presence: true,
            length: { in: 3..100 },
            format: {
                     with: /\A[a-zA-Z]+\Z/,
                     message: "somente permite letras, sem letras e caracteres especiais"
                     }
end
