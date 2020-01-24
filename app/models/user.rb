class User < ActiveRecord::Base
    has_many :reviews
    has_many :products, through: :reviews

    # def favorite_product
    # end

    def remove_reviews(product)
        Review.all.where(product_id: product).find_by(user_id: self.id).destroy
    end


    

end#end class