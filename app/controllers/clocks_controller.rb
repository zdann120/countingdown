class ClocksController < ApplicationController
  before_action :set_clock, only: [:show, :edit, :update, :destroy]
  before_action :set_time_zone, only: [:show]

  # GET /clocks
  def index
    @clocks = Clock.all
  end

  # GET /clocks/1
  def show
    respond_to do |format|
      format.html { render :show }
      format.json {
        render json: @clock.
          duration.
          to_h.merge(
            {title: @clock.title,
             countdown_to: @clock.countdown_to,
             created_at: @clock.created_at,
             delta_seconds: (@clock.countdown_to.to_i - DateTime.now.to_i)}
          )
      }
    end
  end

  # GET /clocks/new
  def new
    @clock = Clock.new
  end

  # GET /clocks/1/edit
  def edit
  end

  # POST /clocks
  def create
    @clock = Clock.new(clock_params)

    if @clock.save
      redirect_to @clock, notice: 'Clock was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /clocks/1
  def update
    if @clock.update(clock_params)
      redirect_to @clock, notice: 'Clock was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /clocks/1
  def destroy
    @clock.destroy
    redirect_to clocks_url, notice: 'Clock was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clock
      @clock = Clock.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def clock_params
      params.require(:clock).permit(:title, :description, :public, :human_time, :time_zone)
    end

    def set_time_zone
      Time.zone = @clock.time_zone
    end
end
