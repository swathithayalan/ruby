class AgencyController < ApplicationController

    def index
        agency = Agency.all
        render json: { status: 'Success', message: 'Load Agencies', data: agency}, status: :ok                  
    end

    def show
        agency = Agency.find(params[:id]);
        render json: { status: 'Success', message: 'show Agency By ID', data: agency}, status: :ok                 
    end

    def create 
        agency = Agency.new(agency_params)

        if agency.save 
            render json: { status: 'Success', message: 'Agency Saved'}, status: :ok
        else
            render json: { status: 'Error', message: 'Agency not Saved', data: agency.errors}, status: :unprocessable_entity
        end
    end

    def destroy
        agency = Agency.find(params[:id]);
        agency.destroy
        render json: { status: 'Success', message: 'Agency Deleted'}, status: :ok
    end

    def update
        agency = Agency.find(params[:id]);
        if agency.update_attributes(agency_params)
            render json: { status: 'Success', message: 'Agency Updated'}, status: :ok
        else
            render json: { status: 'Error', message: 'Agency not Updated', data: agency.errors}, status: :unprocessable_entity
        end  
    end

    private

    def agency_params
        params.permit(:agencyName,:logo)
    end
    
end
