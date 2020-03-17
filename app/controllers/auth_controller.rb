class AuthController < ApplicationController

    #before_action :saasadmin_authorize_request, except: :saasAdminLogin

    def saasAdminLogin
      @user = SaasAdmin.find_by_email(params[:email])
      if @user&.authenticate(params[:password])
        token = JsonWebToken.encode(userId: @user.userId)
        time = Time.now + 24.hours.to_i
        exp = time.strftime("%m-%d-%Y %H:%M")
        render json: { token: token, 
                       userName: @user.firstName, userId: @user.userId }, status: :ok
      else
        render json: { error: 'unauthorized' }, status: :unauthorized
      end
    end 

    def saasUserLogin
      @user = SaasUser.find_by_email(params[:email])
      if @user&.authenticate(params[:password])
        token = JsonWebToken.encode(userId: @user.saasUserId)
        time = Time.now + 24.hours.to_i
        exp = time.strftime("%m-%d-%Y %H:%M")
        render json: { token: token, 
                userId: @user.saasUserId, 
                userName: @user.firstName,
                role: @user.role }, status: :ok
      else
        render json: { error: 'unauthorized' }, status: :unauthorized
      end
    end 
  
    private
  
    def login_params
      params.permit(:email, :password)
    end

end
