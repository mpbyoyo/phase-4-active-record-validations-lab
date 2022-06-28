class Post < ApplicationRecord
  validate :clickbait
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}

  def clickbait
    clicky_titles = ["Won't Believe", "Secret", "Top [number]", "Guess"]
    unless title&& title.include?("Won't Believe" || "Secret" || "Top [number]" || "Guess")
      errors.add(:title, "Not clickbait-y enough!")
    end
  end
end
