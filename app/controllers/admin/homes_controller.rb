class Admin::HomesController < ApplicationController
  def top
  	@order = Order.where("created_at >= ?", Time.zone.now.beginning_of_day).count
  end
end
