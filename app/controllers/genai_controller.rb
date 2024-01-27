class GenaiController < ApplicationController
  # Disable CSRF for POST actions:
  # https://stackoverflow.com/questions/35181340/rails-cant-verify-csrf-token-authenticity-when-making-a-post-request
  protect_from_forgery with: :null_session
  # https://stackoverflow.com/questions/3751030/rails-3-returning-a-http-406-not-acceptable
  #respond_to :json, :html, :csv, :png, :jpg

  def index
  end

  def show
    @answer = "TODO Ale e Seby pics"
    @sobenme = params.fetch :sobenme, '[sobenme] 🤌🏻 nisba from (GET|POST) /genai/show' # from config/routes
    #_common_answer(answer: @answer, sobenme: @sobenme)
    render :layout => false # render foo.html.erb with no layout
  end

  # GET /click
  def click
    @answer = "Yes you GET-clicked me N times"
    @sobenme = params.fetch :sobenme, 'nisba from GET /click' # from config/routes
    _common_answer # (answer: @answer, sobenme: @sobenme)
  end

  # this is when i press BUTTON POST /click :)
  def post_click
    @answer = "Yes you POST-clicked me N times"
    @sobenme = params.fetch :sobenme, 'nisba from POST click' # from config/routes
    _common_answer # (answer: @answer, sobenme: @sobenme)
  end

  def unclick
    # sleep 3
    @answer = "Slow (TODO 3 seconds answer)"
    @sobenme = 'unclick when 3sec elapse'
    _common_answer # (answer: @answer, sobenme: @sobenme)
  end

  def sobenme
    #@answer =
  end

  def why_sky_blue
    sleep(1.seconds)
    @sobenme = '[why_sky_blue][after 😴 sleep 1 💤 mimicking a GenAI computation]'
    @answer = "Blue light is scattered in all directions by the tiny molecules of air in Earth's atmosphere. Blue is scattered more than other colors because it travels as shorter, smaller waves. This is why we see a blue sky most of the time."
    _common_answer # (answer: @answer, sobenme: @sobenme)
    # respond_to do |format|
    #   format.json { render :json => {answer: @answer}  }
    #   format.html { nil }
    # end
  end

  def slow
    sleep 1
    @sobenme = '[slow][after 😴 sleep 1 💤 mimicking a GenAI computation]'
    @answer = "slow sobenme"
    _common_answer # (answer: @answer, sobenme: @sobenme)
  end


protected

  # This method defines common variables (Pic, Sneaky Id, ... which are coming from params[])
  # @answer and @sobenme instead come from the calling controller
  def _common_answer(internal_debug: false)
    @debug = internal_debug # TODO move to false, youll never change this.
    # @answer = answer
    # @sobenme = sobenme
    @pic = params.fetch :pic, "alessandro.jpg" # default
    @sneaky_id =  params.fetch :sneaky_id, "parent-div" # default
    @calling_method = caller_locations(1,1)[0].label
    my_html_return =  "<div id='parent-div'>[_common_answer] GET /click @answer='#{@answer}' (calling_method='<b>#{@calling_method}</b>')</div>"
    # Riccardo linkedin
    #silly_image_html ="<img src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxG0UKThAj69nlebRu6zrpdi1XTy2qHtke6GlO9s4Kjg&s' />"
    silly_image_html = ActionController::Base.helpers.image_tag("mouseclick.png", size: "30x30")
    respond_to do |format|
      #format.html # SE vuoi riabilitare l'HTML normale semplicemente usa questo { render :html => (my_html_return + silly_image_html).html_safe }
      format.html { render :html => (my_html_return + silly_image_html).html_safe }
      format.htmx # { render :htmx }
      format.text { render :text => my_html_return + silly_image_html}
      format.json { render :json => {
        answer: @answer,
        sobenme: @sobenme ,
        sneaky_id: @sneaky_id,
        pic: @pic,
        route: '_common_answer',
        caller: (caller.first.split(':')[0].split('/').last rescue :dunno),
        caller2: caller[0][/`.*'/][1..-2], # https://stackoverflow.com/questions/5100299/how-to-get-the-name-of-the-calling-method
        caller_ruby2: caller_locations(1,1)[0].label, # https://stackoverflow.com/questions/5100299/how-to-get-the-name-of-the-calling-method
        calling_method: @calling_method, # https://stackoverflow.com/questions/5100299/how-to-get-the-name-of-the-calling-method
      }
      # https://stackoverflow.com/questions/13052068/ruby-on-rails-respond-with-and-image-formats
      # #
      #Mime::Type.register "image/png", :png
      #Mime::Type.register "image/jpeg", :jpg
      ## I recorded ricc_image
      #format.png { render silly_image_html } # ricc linkedin
      #format.ricc_image { render silly_image_html } # ricc linkedin
      #format.jpeg { render "<img src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxG0UKThAj69nlebRu6zrpdi1XTy2qHtke6GlO9s4Kjg&s' />" }
      format.csv { render :csv => [[1,2,3]] }
      }
    end
  end

end
