class Link < ActiveRecord::Base
  validates :url, :title, presence: true
  validates :url, format: { with: /\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?\z/ }
end
