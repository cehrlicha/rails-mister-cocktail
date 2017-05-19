class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

  mount_uploader :photo, PhotoUploader

  def self.search(search)
    search_params = search.split
    results = []
    search_params.each do |param|
      results << where("name ILIKE ?", "%#{param}%")
      results << joins(:ingredients).where("ingredients.name ILIKE ?", "#{param}")
    end
    results.flatten.uniq
  end
end


