class OwlsController < ApplicationController
  before_action :set_owl, only: %i[show edit update destroy]

  def index
    @q = Owl.ransack(params[:q])
    @owls = @q.result.default_order.page(params[:page]).per(10)
  end

  def show
  end

  def new
    @owl = Owl.new
  end

  def edit
  end

  def create
    @owl = Owl.new(owl_params)

    if @owl.save
      redirect_to owls_path, notice: 'Owl was successfully created.'
    else
      render :new, status: :unprocessable_content
    end
  end

  def update
    if @owl.update(owl_params)
      redirect_to owls_path, notice: 'Owl was successfully updated.', status: :see_other
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @owl.destroy!
    redirect_to owls_path, notice: 'Owl was successfully destroyed.', status: :see_other
  end

  private

  def set_owl
    @owl = Owl.find(params.expect(:id))
  end

  def owl_params
    params.expect(owl: %i[name age])
  end
end
