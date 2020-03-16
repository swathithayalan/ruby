class SaasAdminController < ApplicationController
    
    #before_action :saasadmin_authorize_request

    def index
        users = SaasAdmin.where("isDeleted = 0")
        render json: { status: 'Success', message: 'Load Users', data: users}, status: :ok                  
    end

    def show
        user = SaasAdmin.find(params[:id]);
        render json: { status: 'Success', message: 'show User By ID', data: user}, status: :ok                 
    end

    def create 
        user = SaasAdmin.new(user_params)

        if user.save 
            render json: { status: 'Success', message: 'User Saved'}, status: :ok
        else
            render json: { status: 'Error', message: 'User not Saved', data: user.errors}, status: :unprocessable_entity
        end
    end

    def destroy
        user = SaasAdmin.find(params[:id]);
        user.isDeleted = 1;
        
        if user.save 
            render json: { status: 'Success', message: 'User Deleted'}, status: :ok
        else
            render json: { status: 'Error', message: 'User not Deleted', data: user.errors}, status: :unprocessable_entity
        end
    end

    def update
        user = SaasAdmin.find(params[:id]);
        if user.update_attributes(user_params)
            render json: { status: 'Success', message: 'User Updated'}, status: :ok
        else
            render json: { status: 'Error', message: 'User not Updated', data: user.errors}, status: :unprocessable_entity
        end  
    end

    private

    def user_params
        params.permit(:firstName,:lastName, :password, :email)
    end
end
