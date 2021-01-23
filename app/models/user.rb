class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Юзер может создавать много событий
  has_many :events
  has_many :comments
  has_many :subscriptions

  after_commit :link_subscriptions, on: :create

  # Добавим заодно валидации для юзера
  # Имя не не более 35 символов
  validates :name, presence: true, length: {maximum: 35}

  before_validation :set_name, on: :create

  # Добавляем аплоадер аватарок, чтобы заработал carrierwave
  mount_uploader :avatar, AvatarUploader

  private

  def set_name
    self.name = "Гуляка №#{rand(777)}" if self.name.blank?
  end

  def link_subscriptions
    Subscription.where(user_id: nil, user_email: self.email)
                .update_all(user_id: self.id)
  end
end
