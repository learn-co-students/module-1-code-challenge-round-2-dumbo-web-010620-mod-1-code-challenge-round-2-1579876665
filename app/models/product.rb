class Product < ActiveRecord::Base
    has_many :reviews
    has_many :users, through: :reviews

    def leave_review(user, star_rating, comment)
        Review.create(product_id: self.id, user: user.id, star_rating: star_rating, comment: comment)
    end

    def print_all_reviews
        self.reviews.each {|rev| puts "#{self.name} by #{rev.user.name}: #{rev.star_rating}. #{rev.comment}"} 
    end

    def average_rating 
        self.reviews.each do |rev|
            rev.star_rating
        end 
    end
end