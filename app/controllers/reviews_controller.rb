class ReviewsController < ApplicationController
    def index 
        @reviews = Review.all 

        render json: @reviews, include: [:hiker, :trail]
    end
    
    def show
        @review = Review.find(params[:id])
        
        render json: @review, include: [:hiker, :trail]
    end

    def create
        @review = Review.create({
            rating: params[:rating],
            review: params[:review],
            hiker_id: params[:hiker_id],
            trail_id: params[:trail_id]
    })

        render json: @review, include: [:hiker, :trail]
    end

    def update
        @review = Review.find(params[:id])
        @review.update(
            rating: params[:rating],
            review: params[:review],
            hiker_id: params[:hiker_id],
            trail_id: params[:trail_id]
        )

        render json: @review, include: [:hiker, :trail]
    end 

    def destroy
        @review = Review.find(params[:id])
        
        @review.destroy

        render json: {message: "The review has been deleted"}
    end
end
