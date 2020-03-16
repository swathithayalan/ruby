class ApplicationController < ActionController::API

    def not_found
        render json: { status: 'Error', message: 'Not Found' }, status: :page_not_found
      end
    
      def saasadmin_authorize_request
        header = request.headers['Authorization']
        header = header.split(' ').last if header
        begin
          @decoded = JsonWebToken.decode(header)
          @current_user = SaasAdmin.find(@decoded[:userId])
        rescue ActiveRecord::RecordNotFound => e
          render json: { status: 'Error', message: 'Record Not Found', errors: e.message }, status: :unauthorized
        rescue JWT::DecodeError => e
          render json: { status: 'Error', message: 'Token Error', errors: e.message }, status: :unauthorized
        end
      end

end
