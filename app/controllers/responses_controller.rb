class ResponsesController < ApplicationController
  before_action :set_response, only: [:show, :edit, :update, :destroy]

  # GET /responses
  # GET /responses.json
  def index
    @responses = Response.all
  end

  # GET /responses/1
  # GET /responses/1.json
  def show
  end

  # GET /responses/new
  def new
    @response = Response.new


    @response.name = session[:name] if session[:name]
    @response.email = session[:email] if session[:email]

  end

  # GET /responses/1/edit
  def edit
  end

  # POST /responses
  # POST /responses.json
  def create
    @response = Response.new(response_params)

    
    session[:updated_at] = Time.now unless session[:updated_at]#連投制限、最初にフォーム投稿したらセッションを初期化する
    if Time.now - session[:updated_at] < 10
      redirect_to root_path,notice:'10秒待って下さい'
    else

    session[:name] = @response.name
    session[:email] = @response.email


    respond_to do |format|
      if @response.save
        session[:updated_at] = Time.now
        format.html { redirect_to root_path, notice: 'Response was successfully created.' }
        format.json { render action: 'show', status: :created, location: @response }
      else
        format.html { render action: 'new' }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end
end
  # PATCH/PUT /responses/1
  # PATCH/PUT /responses/1.json
  def update
    respond_to do |format|

      if @response.update(response_params)
        format.html { redirect_to @response, notice: 'Response was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responses/1
  # DELETE /responses/1.json
  def destroy
    @response.destroy
    respond_to do |format|
      format.html { redirect_to responses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_response
      @response = Response.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def response_params
      params.require(:response).permit(:name, :email, :content, :article_id)
    end
end
