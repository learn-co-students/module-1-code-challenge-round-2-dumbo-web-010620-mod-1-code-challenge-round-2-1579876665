class Product < ActiveRecord::Base
    has_many :reviews
    has_many :users, through: :reviews 

    def leave_review(user, star_rating, comment)
        Review.create(user_id: self.id, star_rating: star_rating, comment: comment)
    end
   
    def print_all_reviews(product, user)
        puts Review for "#{insert product name} by #{insert user name}: #{insert review star_rating}. #{insert review comment}"
    end

    
end