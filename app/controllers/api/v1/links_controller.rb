class Api::V1::LinksController < ApiController
  respond_to :json

  def index
    # respond_with Idea.newest_first
    respond_with Link.all
  end

  def show
    respond_with Link.find(params[:id])
  end

  def new
    respond_with Link.create(idea_params)
  end

  def create
    respond_with Link.create!(idea_params), location: nil
  end

  def update
    respond_with Link.update(params[:id], idea_params), location: nil
  end

  def destroy
    respond_with Link.destroy(params[:id])
  end

  private
    def idea_params
      params.require(:link).permit(:title, :url, :read, :user_id)
    end
end
