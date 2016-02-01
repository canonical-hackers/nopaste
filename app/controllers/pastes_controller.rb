class PastesController < ApplicationController
  respond_to :html, :js
  before_action :set_pastes, only: [:show, :raw, :edit, :fork, :update, :destroy]

  def index
    @paste = Paste.new
    @pastes = Paste.public
    respond_with(@pastes)
  end

  def show
    @original = @paste.original
    @forks = @paste.forks
    respond_with(@paste)
  end

  def raw
    respond_with @paste do |format|
      format.html { render :layout => false }
    end
  end

  def new
    @paste = Paste.new
    respond_with(@paste)
  end

  def fork
    @fork = Paste.new(content: @paste.content,
                      description: @paste.description,
                      language: @paste.language)
    @fork.original = @paste
  end

  def create
    @paste = Paste.new(paste_params)
    @paste.private = true if params[:commit].match(/Private/)
    @paste.user = current_user

    flash[:notice] = 'Paste was successfully created.' if @paste.save
    respond_with(@paste)
  end

  def update
    flash[:notice] = 'Paste was successfully updated.' if @paste.update_attributes(params[:paste])
    respond_with(@paste)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pastes
    @paste = Paste.find_by_param(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def paste_params
    params.require(:paste).permit(:content, :language, :author, :description, :original_id)
  end
end
