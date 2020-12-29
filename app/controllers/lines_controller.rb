class LinesController < ApplicationController

  before_action :find_line, only: [:show, :update, :destroy]

  def index
    @lines = line.all
    render json: @lines
  end

  def show
    render json: @line
  end

  def create
    @line = line.new(line_params)
    if @line.save
      render json: @line
    else
      render error: {error: 'Unable to create line.'}, status:400
    end
  end

  def update
    if @line
      @line.update(line_params)
      render json: {message: 'Line successfully updated. '}, status:200
    else
      render json: {error:'Unable to update line'}, status:400
    end
  end

  def destroy
    if @line
      @line.destroy
      render json: {message: 'line successfully deleted.'}, status: 200
    else
      render json: {error: 'Unable to delete line.'}, status:400
    end
  end

  private

  def fact_line
    @line = line.find(params[:id])
  end

  def line_params
    params.require(:graph_id).permit(:x,:y)
  end
end
