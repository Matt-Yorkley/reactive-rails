module Admin
  class SubscriptionsController < Admin::BaseController
    before_action :set_subscription, only: [:show, :edit, :update, :destroy]

    def index
      @subscriptions = Subscription.all
    end

    def show
    end

    def new
      @subscription ||= Subscription.new
    end

    def edit
    end

    def create
      @subscription = Subscription.new(subscription_params)

      if @subscription.save
        redirect_to admin_subscriptions_path, notice: 'Subscription was successfully created.'
      else
        render :new
      end
    end

    def update
      if @subscription.update(subscription_params)
        redirect_to admin_subscriptions_path, notice: 'Subscription was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @subscription.destroy

      redirect_to admin_subscriptions_url, notice: 'Subscription was successfully destroyed.'
    end

    private

    def set_subscription
      @subscription ||= Subscription.find(params[:id])
    end

    def subscription_params
      params.require(:subscription).permit(:tier, :price, :user_id)
    end
  end
end
