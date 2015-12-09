class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @boards = Board.visible.has_pins.paginate(page: params[:page], per_page: 10)
  end

  def manage
    @boards = current_user.boards.paginate(page: params[:page], per_page: 10)
    render 'boards/index'
  end

  def show
    @pins = @board.pins.paginate(page: params[:page], per_page: 10)
  end

  def new
    @board = current_user.boards.build
  end

  def edit
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to @board, notice: 'Board was successfully created.'
    else
      render :new
    end
  end

  def update
    if @board.update(board_params)
      redirect_to @board, notice: 'Board was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @board.destroy
    redirect_to boards_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board
      @board = Board.find(params[:id])
    end

    def correct_user
      @board = current_user.boards.find_by(id: params[:id])
      redirect_to pins_path, notice: "Not authorized to edit this board" if @board.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def board_params
      params.require(:board).permit(:description, :name, :public)
    end
end
