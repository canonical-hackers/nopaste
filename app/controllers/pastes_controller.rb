class PastesController < ApplicationController
  respond_to :html, :js

  def index
    @paste = Paste.new
    @pastes = Paste.public
    respond_with(@pastes)
  end

  def show
    @paste = Paste.find(params[:id])
    @original = @paste.original
    @forks = @paste.forks
    respond_with(@paste)
  end

  def raw
    @paste = Paste.find(params[:id])
    respond_with @paste do |format|
      format.html { render :layout => false }
    end
  end

  def new
    @paste = Paste.new
    respond_with(@paste)
  end

  def fork
    @original = Paste.find(params[:id])
    @paste = Paste.new( :content => @original.content,
                        :description => @original.description,
                        :language => @original.language)
    @paste.original = @original
  end

  def create
    @paste = Paste.new(params[:paste])
    @paste.private = true if params[:commit].match(/Private/)
    @paste.user = current_user

    flash[:notice] = 'Paste was successfully created.' if @paste.save
    respond_with(@paste)
  end

  def update
    @paste = Paste.find(params[:id])

    flash[:notice] = 'Paste was successfully updated.' if @paste.update_attributes(params[:paste])
    respond_with(@paste)
  end
end
