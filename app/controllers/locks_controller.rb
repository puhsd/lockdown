class LocksController < ApplicationController
  before_action :set_lock, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user,  :except => [:show, :link]
  skip_before_action :verify_authenticity_token, only: :link

  # GET /locks
  # GET /locks.json
  def index
    # @locks = Lock.all
    @locks =  policy_scope(Lock)
  end

  # GET /locks/1
  # GET /locks/1.json
  def show
    authorize @lock
  end

  # GET /locks/new
  def new
    authorize Lock
    @lock = Lock.new
  end

  # GET /locks/1/edit
  def edit
    authorize @lock
  end

  # POST /locks
  # POST /locks.json
  def create
    authorize Lock
    @lock = Lock.new(lock_params)

    respond_to do |format|
      if @lock.save
        format.html { redirect_to @lock, notice: 'Lock was successfully created.' }
        format.json { render :show, status: :created, location: @lock }
      else
        format.html { render :new }
        format.json { render json: @lock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locks/1
  # PATCH/PUT /locks/1.json
  def update
    respond_to do |format|
      if @lock.update(lock_params)
        format.html { redirect_to @lock, notice: 'Lock was successfully updated.' }
        format.json { render :show, status: :ok, location: @lock }
      else
        format.html { render :edit }
        format.json { render json: @lock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locks/1
  # DELETE /locks/1.json
  def destroy
    @lock.destroy
    respond_to do |format|
      format.html { redirect_to locks_url, notice: 'Lock was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def link
    @lock = Lock.find_by_code(params['code'].downcase) if params['code']
    if @lock != nil
      respond_to do |format|
          format.html {  }
          format.json { render json: @lock.as_json(only: [:url]) }
          format.js do
            render :json => @lock.as_json(only: [:url]), :callback => params[:callback]
            puts "jsonp"
          end
      end
    else
      respond_to do |format|
        format.html {  }
        format.json { render json: {"url" => "/link"}.as_json }
      end
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lock
      @lock = Lock.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lock_params
      params.require(:lock).permit(:url, :user_id, :name)
    end
end
