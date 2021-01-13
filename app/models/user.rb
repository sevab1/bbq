class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Юзер может создавать много событий
  has_many :events

  # Добавим заодно валидации для юзера
  # Имя не не более 35 символов
  validates :name, presence: true, length: {maximum: 35}

  before_validation :set_name, on: :create

  private

  def set_name
    self.name = "Гуляка №#{rand(777)}" if self.name.blank?
  end
end
