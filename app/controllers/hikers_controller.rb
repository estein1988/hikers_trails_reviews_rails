class HikersController < ApplicationController

    def index
        @hikers = Hiker.all 
        render json: @hikers, include: [:trails, :reviews]
    end

    def show
        @hiker = Hiker.find(params[:id])
        render json: @hiker, include: [:trails, :reviews]
    end

    def create
        @hiker = Hiker.create({
            name: params[:name],
            age: params[:age],
            experience: params[:experience]
        })
        render json: @hiker, include: [:reviews, :trails]
    end

    def update
        @hiker = Hiker.find(params[:id])

        @hiker.update(
            name: params[:name],
            age: params[:age],
            experience: params[:experience]
        )

        render json: @hiker
    end 

    def destroy
        @hiker = Hiker.find(params[:id])
        
        @hiker.destroy
        
        render json: {message: "The hiker has vanished"}
    end
end
