class Post < ApplicationRecord

    validate :clickbait_y

    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: ["Fiction", "Non-Fiction"]

    CLICKBAIT_PATTERNS = [
        /Won't Believe/i,
        /Secret/i,
        /Top \d/i,
        /Guess/i
      ]
    
      def clickbait_y
        if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
          errors.add(:title, "make more clickbaity!")
        end
      end
end
