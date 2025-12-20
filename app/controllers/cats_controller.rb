class CatsController < ApplicationController
  before_action :set_cat, only: %i[show edit update destroy]

  def index
    @q = Cat.ransack(params[:q])
    @cats = @q.result.default_order.page(params[:page])
  end

  def show
  end

  def new
    @cat = Cat.new
  end

  def edit
  end

  def create
    @cat = Cat.new(cat_params)

    if @cat.save
      redirect_to @cat, notice: 'Cat was successfully created.'
    else
      render :new, status: :unprocessable_content
    end
  end

  def update
    if @cat.update(cat_params)
      redirect_to @cat, notice: 'Cat was successfully updated.', status: :see_other
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @cat.destroy!
    redirect_to cats_path, notice: 'Cat was successfully destroyed.', status: :see_other
  end

  private

  def set_cat
    @cat = Cat.find(params.expect(:id))
  end

  def cat_params
    params.expect(cat: %i[name age])
  end
end
