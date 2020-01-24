class Product < ActiveRecord::Base
    has_many :reviews
    has_many :users, through: :reviews

    def leave_review (user, star_rating, comment)
        Review.create(star_rating: star_rating, user: user, comment: comment, product_id: self.id)
    end

    
    def print_all_reviews
        
        puts "Review for #{self.name} by #{self.user.name}: #{self.review.star_rating}. #{self.review.comment}"

        #should `puts` to the terminal a string representing each review for this product
        #each review should be formatted as follows: `Review for {insert product name} by {insert user name}: {insert review star_rating}. {insert review comment}`
    end

    def average_rating
        #returns a `float` representing the average star rating for all reviews for this product
       a_r = Review.where(product_id: self.id).sum(:star_rating)
       a_r/Review.where(product_id: self.id).length.to_f
    end

end