class Api::V1::IdeasController < ApiController
  respond_to :json

  def index
    respond_with Link.all
  end

  # def show
  #   respond_with Link.find(params[:id])
  # end
  #
  # def new
  #   respond_with Link.create(link_params)
  # end
  #
  # def create
  #   respond_with Link.create!(link_params), location: nil
  # end
  #
  # def update
  #   respond_with Link.update(params[:id], link_params), location: nil
  # end
  #
  # def destroy
  #   respond_with Link.destroy(params[:id])
  # end

  private
    def link_params
      params.require(:link).permit(:title, :body, :quality)
    end
end
