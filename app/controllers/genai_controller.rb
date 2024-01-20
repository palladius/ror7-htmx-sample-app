class GenaiController < ApplicationController
  def index
  end

  def show
  end

  def click
    @answer = "Yes you clicked me N times"
    respond_to do |format|
      format.html {
        #redirect_to post_url(@post), notice: "Post was successfully created."
      }
      #format.json { render :show, status: :created, answer: @answer }
      format.json {
        render :json => {answer: @answer}
#        render :show, action: 'click', answer: @answer
      }
    end
    # maybe return a json?
  end

  def unclick
  end

  def sobenme
  end

  def why_sky_blue
    @answer = "TODO(add sleep 3): Blue light is scattered in all directions by the tiny molecules of air in Earth's atmosphere. Blue is scattered more than other colors because it travels as shorter, smaller waves. This is why we see a blue sky most of the time."
    respond_to do |format|
      format.json {
        render :json => {answer: @answer}
      }
    end
  end
end
