class ArgumentativeAnswersController < ApplicationController
  before_action :set_argumentative_answer, only: [:show, :edit, :update, :destroy]

  # GET /argumentative_answers
  # GET /argumentative_answers.json
  def index
    @argumentative_answers = ArgumentativeAnswer.all
  end

  # GET /argumentative_answers/1
  # GET /argumentative_answers/1.json
  def show
  end

  # GET /argumentative_answers/new
  def new
    @argumentative_answer = ArgumentativeAnswer.new
  end

  # GET /argumentative_answers/1/edit
  def edit
  end

  # POST /argumentative_answers
  # POST /argumentative_answers.json
  def create
    @argumentative_answer = ArgumentativeAnswer.new(argumentative_answer_params)

    respond_to do |format|
      if @argumentative_answer.save
        format.html { redirect_to @argumentative_answer, notice: 'Argumentative answer was successfully created.' }
        format.json { render :show, status: :created, location: @argumentative_answer }
      else
        format.html { render :new }
        format.json { render json: @argumentative_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /argumentative_answers/1
  # PATCH/PUT /argumentative_answers/1.json
  def update
    respond_to do |format|
      if @argumentative_answer.update(argumentative_answer_params)
        format.html { redirect_to @argumentative_answer, notice: 'Argumentative answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @argumentative_answer }
      else
        format.html { render :edit }
        format.json { render json: @argumentative_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /argumentative_answers/1
  # DELETE /argumentative_answers/1.json
  def destroy
    @argumentative_answer.destroy
    respond_to do |format|
      format.html { redirect_to argumentative_answers_url, notice: 'Argumentative answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_argumentative_answer
      @argumentative_answer = ArgumentativeAnswer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def argumentative_answer_params
      params.fetch(:argumentative_answer, {})
    end
end
