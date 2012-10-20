class PastesController < ApplicationController
  respond_to :html, :js

  def index
    @pastes = Paste.all

    respond_with(@pastes)
  end

  def show
    @paste = Paste.find(params[:id])
    respond_with(@paste)
  end

  def new
    @paste = Paste.new

    respond_with(@paste)
  end

  def edit
    @paste = Paste.find(params[:id])
  end

  def create
    @paste = Paste.new(params[:paste])
    
    flash[:notice] = 'Paste was successfully created.' if @paste.save 
    respond_with(@paste)
  end

  def update
    @paste = Paste.find(params[:id])

    flash[:notice] = 'Paste was successfully updated.' if @paste.save 
    respond_with(@paste)
  end

  def destroy
    @paste = Paste.find(params[:id])
    @paste.destroy
    
    redirect_to pastes_url
  end
end
