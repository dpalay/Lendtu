class IdentitiesController < ApplicationController
  def index

  end

  def edit

  end

  def create
    @identity = Identity.new(provider: 'LendTu')
    @identity.save!
    redirect_to
  end

  def show

  end

  def update

  end

  def destroy

  end

  def new

  end

  private

end
