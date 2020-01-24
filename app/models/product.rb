class Product < ActiveRecord::Base
    has_many :reviews
    has_many :users, through: :reviews

    def leave_review(user, star_rating, comment)
        Review.create(user_id: user.id, star_rating: star_rating, comment: comment, product_id: self.id)
    end

    def print_all_reviews
        self.reviews.each do |inst| 
            puts inst.comment
        end
    end

    def average_rating
        x = Review.all.where(star_rating: self.id).sum(:star_rating)
        # avg_rating = x / x.length.to_f
    end


end