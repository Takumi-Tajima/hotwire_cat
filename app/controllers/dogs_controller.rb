class DogsController < ApplicationController
  before_action :set_dog, only: %i[show edit update destroy]

  def index
    @q = Dog.ransack(params[:q])
    @dogs = @q.result.default_order.page(params[:page]).per(10)
  end

  def show
  end

  def new
    @dog = Dog.new
  end

  def edit
  end

  def create
    @dog = Dog.new(dog_params)

    if @dog.save
      redirect_to dogs_path, notice: 'Dog was successfully created.'
    else
      render :new, status: :unprocessable_content
    end
  end

  def update
    if @dog.update(dog_params)
      redirect_to dogs_path, notice: 'Dog was successfully updated.', status: :see_other
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @dog.destroy!
    redirect_to dogs_path, notice: 'Dog was successfully destroyed.', status: :see_other
  end

  private

  def set_dog
    @dog = Dog.find(params.expect(:id))
  end

  def dog_params
    params.expect(dog: %i[name age])
  end
end
