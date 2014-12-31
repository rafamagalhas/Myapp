class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]
  
  def vote
    type = params[:type] # up/down
    answer = Answer.find(params[:answer_id])
    if type == 'up'
      answer.vote(current_user,:up)
    elsif type=='down'
      answer.vote(current_user,:down)
    else
      render :text => 'Unknown vote type, use "up" or "down"'
      return
    end
    render :text => "#{answer.vote_balance}"
  end

  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
  end

  # GET /answers/new
  def new
    @answer = Answer.new
    session[:question_id] = params[:question_id]
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer = Answer.new(answer_params)
    @answer.question_id = session['question_id']
    @answer.user = current_user
    session[:question_id] = nil

    respond_to do |format|
      if @answer.save
        format.html { redirect_to @answer.question, notice: t('notice.created', model: @answer.model_name.human) }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { render :new }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to @answer, notice: t('notice.updated', model: @answer.model_name.human) }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:content)
    end
end
