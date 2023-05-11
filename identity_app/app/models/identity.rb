class Identity < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  def to_json(options = {})
    { id:, email: }.to_json(options)
  end
end
