class HedgehogsController < ApplicationController
  before_action :set_hedgehog, only: %i[show edit update destroy]

  def index
    @q = Hedgehog.ransack(params[:q])
    @hedgehogs = @q.result.default_order.page(params[:page]).per(10)
  end

  def show
  end

  def new
    @hedgehog = Hedgehog.new
  end

  def edit
  end

  def create
    @hedgehog = Hedgehog.new(hedgehog_params)

    if @hedgehog.save
      redirect_to hedgehogs_path, notice: 'Hedgehog was successfully created.'
    else
      render :new, status: :unprocessable_content
    end
  end

  def update
    if @hedgehog.update(hedgehog_params)
      redirect_to hedgehogs_path, notice: 'Hedgehog was successfully updated.', status: :see_other
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @hedgehog.destroy!
    redirect_to hedgehogs_path, notice: 'Hedgehog was successfully destroyed.', status: :see_other
  end

  private

  def set_hedgehog
    @hedgehog = Hedgehog.find(params.expect(:id))
  end

  def hedgehog_params
    params.expect(hedgehog: %i[name age])
  end
end
