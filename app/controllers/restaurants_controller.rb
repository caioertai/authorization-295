class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = policy_scope(Restaurant)
  end

  def show
    # Will look for the #show? method on the
    # RestaurantPolicies

    # @restaurant will be the record
    authorize @restaurant
  end

  def new
    @restaurant = Restaurant.new
    authorize @restaurant
  end

  def edit
    authorize @restaurant
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user

    # After the record is found
    authorize @restaurant
    # Before the relevant sentence (save/update/etc...)

    if @restaurant.save
      redirect_to @restaurant, notice: 'Restaurant was successfully created.'
    else
      render :new
    end
  end

  def update
    authorize @restaurant
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant, notice: 'Restaurant was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @restaurant
    @restaurant.destroy
    redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def restaurant_params
      params.require(:restaurant).permit(:name)
    end
end
