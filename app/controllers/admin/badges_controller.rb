# frozen_string_literal: true

module Admin
  class BadgesController < Admin::BaseController
    
    before_action :set_bades, only: %i[index]
    before_action :find_badge, only: %i[show edit update destroy]

    rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_badge_not_found

    def index; end

    def show; end

    def new
      @badge = Badge.new
    end

    def edit; end

    def create
      @badge = current_user.badges.new(badge_params)

      if @badge.save
        redirect_to admin_badge_path(@badge), notice: t('.success')
      else
        render :new
      end
    end

    def update
      if @badge.update(badge_params)
        redirect_to admin_badge_path(@badge), notice: t('.success')
      else
        render :edit
      end
    end

    def destroy
      @badge.destroy

      redirect_to admin_badges_path, notice: t('.success')
    end

    private

    def set_badges
      @badges = Badge.all
    end

    def find_badge
      @badge = Badge.find(params[:id])
    end

    def badge_params
      params.require(:badge).permit(:title, :image, :rule_mame, :rule_value)
    end

    def rescue_with_badge_not_found
      render plain: t('.badge')
    end
  end
end
