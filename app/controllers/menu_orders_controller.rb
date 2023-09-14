class MenuOrdersController < ApplicationController
  before_action :find_menu, only: %i[new create]

  def new
    @menu_order ||= MenuOrder.new
    @dishes = @menu.dishes if @menu
    @ingredients = @menu.ingredients if @menu
  end

  def create
    order = OrderCreator.new(@menu, params[:remove_ingredient_ids]).create_order
    if order
      flash[:notice] = I18n.t('menu_orders.new.notice')
      redirect_to root_path
    else
      flash[:error] = I18n.t('menu_orders.new.error')
      redirect_to new_menu_order_path(@menu_order)
    end
  end

  private

  def find_menu
    @menu = Menu.find(params[:menu_id]) if params[:menu_id]
    @menu ||= Menu.first
  end
end
