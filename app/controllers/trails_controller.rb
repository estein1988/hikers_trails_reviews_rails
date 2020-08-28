class TrailsController < ApplicationController
    def index 
        @trails = Trail.all 
        
        render json: @trails, include: [:reviews, :hikers]
    end 

    def show
        @trail = Trail.find(params[:id])

        render json: @trail, include: [:reviews, :hikers]
    end

    def create
        @trail = Trail.create({
            name: params[:name],
            location: params[:location],
            difficulty: params[:difficulty],
            length: params[:length],
            elevation: params[:elevation],
            route: params[:route]
    })

        render json: @trail, include: [:reviews, :hikers]
    end

    def update
        @trail = Trail.find(params[:id])

        @trail.update(
            name: params[:name],
            location: params[:location],
            difficulty: params[:difficulty],
            length: params[:length],
            elevation: params[:elevation],
            route: params[:route]
        )

        render json: @trail, include: [:reviews, :hikers]
    end

    def destroy
        @trail = Trail.find(params[:id])

        @trail.destroy
        
        render json: {message: "The trail has been deleted"}
    end
end
