class SubscriptionPlansController < ApplicationController

    def index
        plans = SubscriptionPlan.all
        render json: { status: 'Success', message: 'Load SubscriptionPlans', data: plans}, status: :ok                  
    end

    def show
        plan = SubscriptionPlan.find(params[:id]);
        render json: { status: 'Success', message: 'show SubscriptionPlans By ID', data: plan }, status: :ok                 
    end

    def create 
        plan = SubscriptionPlan.new(plan_params)

        if plan.save 
            render json: { status: 'Success', message: 'Plan Saved'}, status: :ok
        else
            render json: { status: 'Error', message: 'Plan not Saved', data: plan.errors}, status: :unprocessable_entity
        end
    end

    def destroy
        plan = SubscriptionPlan.find(params[:id]);
        plan.destroy
        render json: { status: 'Success', message: 'Plan Deleted'}, status: :ok
    end

    private

    def plan_params
        params.permit(:name,:description, :amount, :discount, :durationType)
    end
end
