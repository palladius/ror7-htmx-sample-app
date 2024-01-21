class GenaiController < ApplicationController
  def index
  end

  def show
  end

  # GET /click
  def click
    @answer = "Yes you GET-clicked me N times"
    @sobenme = params.fetch :sobenme, 'nisba from GET /click' # from config/routes
    respond_to do |format|
      format.html {
        #redirect_to post_url(@post), notice: "Post was successfully created."
      }
      #format.json { render :show, status: :created, answer: @answer }
      format.json {
        render :json => {answer: @answer, sobenme: @sobenme }
#        render :show, action: 'click', answer: @answer
      }
    end
    # maybe return a json?
  end

  # this is when i press BUTTON POST /click :)
  def post_click
    @answer = "Yes you POST-clicked me N times"
    @sobenme = params.fetch :sobenme, 'nisba from POST click' # from config/routes
  end

  def unclick
  end

  def sobenme
  end

  def why_sky_blue
    @answer = "TODO(add sleep 3): Blue light is scattered in all directions by the tiny molecules of air in Earth's atmosphere. Blue is scattered more than other colors because it travels as shorter, smaller waves. This is why we see a blue sky most of the time."
    respond_to do |format|
      format.json { render :json => {answer: @answer}  }
      format.html { nil }
    end
  end
end
