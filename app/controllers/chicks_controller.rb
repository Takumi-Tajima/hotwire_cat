class ChicksController < ApplicationController
  before_action :set_chick, only: %i[show edit update destroy]

  def index
    @chicks = Chick.default_order
  end

  def show
  end

  def new
    @chick = Chick.new
  end

  def edit
  end

  def create
    @chick = Chick.new(chick_params)

    if @chick.save
      redirect_to @chick, notice: 'Chick was successfully created.'
    else
      render :new, status: :unprocessable_content
    end
  end

  def update
    if @chick.update(chick_params)
      redirect_to @chick, notice: 'Chick was successfully updated.', status: :see_other
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @chick.destroy!
    redirect_to chicks_path, notice: 'Chick was successfully destroyed.', status: :see_other
  end

  private

  def set_chick
    @chick = Chick.find(params.expect(:id))
  end

  def chick_params
    params.expect(chick: %i[name age])
  end
end
