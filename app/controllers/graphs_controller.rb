class GraphsController < ApplicationController
  before_action :find_graph, only: [:show, :update, :destroy]

  def index
    @graphs = Graph.all
    render json: @graphs
  end

  def show
    render json: @graph
  end

  def create
    @graph = Graph.new(graph_params)
    if @graph.save
      render json: @graph
    else
      render error: {error: 'Unable to create graph.'}, status:400
    end
  end

  def update
    if @graph
      @graph.update(graph_params)
      render json: {message: 'Graph successfully updated. '}, status:200
    else
      render json: {error:'Unable to update Graph'}, status:400
    end
  end

  def destroy
    if @graph
      @graph.destroy
      render json: {message: 'Graph successfully deleted.'}, status: 200
    else
      render json: {error: 'Unable to delete graph.'}, status:400
    end
  end

  private

  def fact_graph
    @graph = Graph.find(params[:id])
  end

  def graph_params
    params.require(:name)
  end
end
