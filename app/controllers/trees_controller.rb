class TreesController < ApplicationController
  before_action :set_tree, only: [:answer, :show, :edit, :update, :destroy]
  before_action :set_user, only: [:answer, :show]
  before_action :set_node, only: [:answer, :show]
  before_action :check_complete, only: [:show]

  def reset
    session[:current_user_id] = nil
    session[:current_node_id] = nil
    ArgumentativeAnswer.destroy_all
    Response.destroy_all
    redirect_to root_path
  end

  # POST
  def answer
    @question = @node.questionable

    correct, score, feedback, ans, ars = @question.evaluate_answer(params)
    answerable = ArgumentativeAnswer.create(answer_score: ans, argument_score: ars, answer: @question.send("answer#{params[:answer].to_i}"), argument: @question.send("argument#{params[:argument].to_i}"))
    Response.create(questionable: @question, answerable: answerable, user: @user, node: @node, score: score)

    flash[:feedback] = feedback
    if correct
      if @node.is_last?
        session[:current_node_id] = nil
        redirect_to thankyou_path
      else
        session[:current_node_id] = @node.next_node_correct.id
        redirect_to @tree
      end
    else
      if @node.is_repeat?
        if @user.can_answer?(@node)
          redirect_to @tree
        else
          session[:current_node_id] = nil
          redirect_to thankyou_path
        end
      else
        session[:current_node_id] = @node.next_node_wrong.id
        redirect_to @tree
      end
    end
  end

  # GET /trees
  # GET /trees.json
  def index
    @trees = Tree.all
  end

  # GET /trees/1
  # GET /trees/1.json
  def show
    @question = @node.questionable
  end

  # GET /trees/new
  def new
    @tree = Tree.new
    # @first_node = @tree.nodes.build(first_node: true)
    # @first_node.questionable = ArgumentativeQuestion.new
    # @n12 = @tree.nodes.build
    # @n12.questionable = ArgumentativeQuestion.new
    # @n21 = @tree.nodes.build
    # @n21.questionable = ArgumentativeQuestion.new

    # @first_node.next_node_correct = @n21
    # @first_node.next_node_wrong = @n12

    # @n12.next_node_correct = @n21
    # @n12.next_node_wrong = @n12

    # @n21.next_node_correct = nil
    # @n21.next_node_wrong = @n21
  end

  # GET /trees/1/edit
  def edit
  end

  # POST /trees
  # POST /trees.json
  def create
    @tree = Tree.new(tree_params)

    respond_to do |format|
      if @tree.save
        format.html { redirect_to trees_path, notice: 'Árbol creado' }
        format.json { render :show, status: :created, location: @tree }
      else
        format.html { render :new }
        format.json { render json: @tree.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trees/1
  # PATCH/PUT /trees/1.json
  def update
    respond_to do |format|
      if @tree.update(tree_params)
        format.html { redirect_to trees_path, notice: 'Árbol actualizado' }
        format.json { render :show, status: :ok, location: @tree }
      else
        format.html { render :edit }
        format.json { render json: @tree.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trees/1
  # DELETE /trees/1.json
  def destroy
    @tree.destroy
    respond_to do |format|
      format.html { redirect_to trees_url, notice: 'Árbol eliminado.' }
      format.json { head :no_content }
    end
  end

  private

  def check_complete
    puts @user.inspect
    puts @node.inspect
    unless @user.can_answer?(@node)
      session[:current_node_id] = nil
      redirect_to thankyou_path
    end
  end

  def set_node
    unless @node = Node.find_by(id: session[:current_node_id])
      session[:current_node_id] = @tree.first_node.id
      @node = @tree.first_node
    end
  end

  def set_user
    student_id = params[:user_id]
    session[:current_user_id] = nil if student_id
    student_id ||= 'student'
    unless @user = User.find_by(id: session[:current_user_id])
      @user = User.find_or_create_by(student_id: student_id)
      @user.email ||= params['lis_person_contact_email_primary']
      @user.username ||= params['lis_person_sourcedid']
      @user.save if @user.changed?
    end
    session[:current_user_id] = @user.id
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_tree
    @tree = Tree.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def tree_params
    params.require(:tree).permit(:label, :n_repeat, :first_node_id, :course_id,
                                 nodes_attributes: [:id, :first_node, :next_node_wrong, :next_node_correct, :questionable_type, questionable_attributes: [ :id, :question]], nodes_ids: [])
  end
end
