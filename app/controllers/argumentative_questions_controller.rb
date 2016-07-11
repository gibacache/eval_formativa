class ArgumentativeQuestionsController < ApplicationController
  before_action :set_argumentative_question, only: [:show, :edit, :update, :destroy]

  # GET /argumentative_questions
  # GET /argumentative_questions.json
  def index
    @argumentative_questions = ArgumentativeQuestion.all
  end

  # GET /argumentative_questions/1
  # GET /argumentative_questions/1.json
  def show
    render :edit
  end

  # GET /argumentative_questions/new
  def new
    @argumentative_question = ArgumentativeQuestion.new
  end

  # GET /argumentative_questions/1/edit
  def edit
  end

  # POST /argumentative_questions
  # POST /argumentative_questions.json
  def create
    @argumentative_question = ArgumentativeQuestion.new(argumentative_question_params)

    respond_to do |format|
      if @argumentative_question.save
        format.html { redirect_to argumentative_questions_path, notice: 'Pregunta creada.' }
        format.json { render :show, status: :created, location: @argumentative_question }
      else
        format.html { render :new }
        format.json { render json: @argumentative_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /argumentative_questions/1
  # PATCH/PUT /argumentative_questions/1.json
  def update
    respond_to do |format|
      if @argumentative_question.update(argumentative_question_params)
        format.html { redirect_to argumentative_questions_path, notice: 'Pregunta actualizada.' }
        format.json { render :show, status: :ok, location: @argumentative_question }
      else
        format.html { render :edit }
        format.json { render json: @argumentative_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /argumentative_questions/1
  # DELETE /argumentative_questions/1.json
  def destroy
    @argumentative_question.destroy
    respond_to do |format|
      format.html { redirect_to argumentative_questions_url, notice: 'Pregunta eliminada.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_argumentative_question
      @argumentative_question = ArgumentativeQuestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def argumentative_question_params
      params.require(:argumentative_question).permit(:question,:answer1, :answer2, :answer3, :answer4, :argument1, :argument2, :argument3      , :argument4      , :correct_answer      , :correct_argument      , :feedback_wrong_argument, :feedback_wrong      , critical_thinking_list: [], subject_list: [])
    end
end
