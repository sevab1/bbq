class Event < ApplicationRecord
  # Событие принадлежит юзеру
  belongs_to :user

  has_many :comments
  has_many :subscriptions
  # Чтобы Рельсы понимали, какой именно класс будет лежать
  # в модели subscribers, надо указать source
  has_many :subscribers, through: :subscriptions, source: :user

  # Валидируем заголовок, он не может быть длиннее 255 букв
  validates :title, presence: true, length: {maximum: 255}
  # У события должны быть заполнены место и время
  validates :address, presence: true
  validates :datetime, presence: true

  # Валидируем юзера на присутствие. В Rails 5 связи
  # валидируются по умолчанию
  validates :user, presence: true

end
