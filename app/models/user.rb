class User < ActiveRecord::Base
    has_many :reviews
    has_many :products, through: :reviews



    def favorite_product
        Review.where(:star_rating)
        #returns the product instance that has the highest star rating from this user

    end

    def remove_reviews(product)
        Review.where()
        #takes a `Product` (an instance of the `Product` class) and removes *all* of this user's reviews for that product
  #you will have to delete any rows from the `reviews` table associated with this user and the product
    end
    

    def self.most_reviews
        self.all.max_by {|x| x.reviews}
        #returns *one* User instance for the User who has given the most reviews
    end

  
end