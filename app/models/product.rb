class Product < ActiveRecord::Base
    has_many :reviews
    has_many :users, through: :reviews


    def leave_review(user, star_rating, comment)

        Review.create(comment: comment, star_rating: star_rating, user_id: user.id, product_id: self.id)

    end

    def print_all_reviews

        Review.where(product_id: self.id)

    end

    def average_rating
        
        a1 = Review.where(product_id: self.id).sum(:star_rating)
        a1 / Review.where(product_id: self.id).length.to_f

    end

#       t.string :comment
#       t.integer :star_rating
#       t.integer :user_id
#       t.integer :product_id

    
end
























