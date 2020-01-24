class User < ActiveRecord::Base
    has_many :reviews
    has_many :products, through: :reviews

    def favorite_product

        Review.where(user_id: self.id).order(:star_rating, :desc).first

    end


    def self.most_reviews

        self.all.max_by { |inst| inst.reviews.length }

    end


end


#       t.string :comment
#       t.integer :star_rating
#       t.integer :user_id
#       t.integer :product_id

