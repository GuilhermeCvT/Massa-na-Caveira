class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associação dos campos com as tabelas "companies" e "entrances"
  belongs_to :company
  belongs_to :entrance

  paginates_per 5
end
