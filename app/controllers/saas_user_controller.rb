class SaasUserController < ApplicationController

    def index
        users = SaasUser.where("isDeleted = 0");
        render json: { status: 'Success', message: 'Load Users', data: users}, status: :ok                  
    end

    def show
        user = SaasUser.find(params[:id]);
        render json: { status: 'Success', message: 'show User By ID', data: user}, status: :ok                 
    end

    def view
        user = SaasUser.joins(:role).where(role: 3);
        render json: { status: 'Success', message: 'show User By ID', data: user}, status: :ok                 
    end

    def create 
        user = SaasUser.new(user_params)

        if user.save   
            render json: { status: 'Success', message: 'User Saved'}, status: :ok
        else
            render json: { status: 'Error', message: 'User not Saved', data: user.errors}, status: :unprocessable_entity
        end
    end

    def destroy
        user = SaasUser.find(params[:id]);
        user.isDeleted = 0;
        
        if user.save 
            render json: { status: 'Success', message: 'User Deleted'}, status: :ok
        else
            render json: { status: 'Error', message: 'User not Deleted', data: user.errors}, status: :unprocessable_entity
        end
    end
     
    def update
        user = SaasUser.find(params[:id]);
        if user.update_attributes(user_params)
            render json: { status: 'Success', message: 'User Updated'}, status: :ok
        else
            render json: { status: 'Error', message: 'User not Updated', data: user.errors}, status: :unprocessable_entity
        end  
    end

    private

    def user_params
        params.permit(:firstName, :lastName, :password, :email, :phoneNumber, :street, :apartment, :state, :city, :country, :postalcode, :subDomainURL)
    end
end
