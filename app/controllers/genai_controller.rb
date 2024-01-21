class GenaiController < ApplicationController
  # Disable CSRF for POST actions:
  # https://stackoverflow.com/questions/35181340/rails-cant-verify-csrf-token-authenticity-when-making-a-post-request
  protect_from_forgery with: :null_session

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
    #return
    _common_answer(answer: @answer, sobenme: @sobenme)
#     respond_to do |format|
#       format.html {        #redirect_to post_url(@post), notice: "Post was successfully created."
#         render :html => "<div id='parent-div'>GET /click @answer='#{@answer}'</div>"
#       }
#       #format.json { render :show, status: :created, answer: @answer }
#       format.json {
#         render :json => {answer: @answer, sobenme: @sobenme }
# #        render :show, action: 'click', answer: @answer
#       }
#     end
    # maybe return a json?
  end

  # this is when i press BUTTON POST /click :)
  def post_click
    @answer = "Yes you POST-clicked me N times"
    @sobenme = params.fetch :sobenme, 'nisba from POST click' # from config/routes
    _common_answer(answer: @answer, sobenme: @sobenme)
  end

  def unclick
    # sleep 3
    @answer = "Slow (TODO 3 seconds answer)"
    @sobenme = 'unclick when 3sec elapse'
    _common_answer(answer: @answer, sobenme: @sobenme)
  end

  def sobenme
    #@answer =
  end

  def why_sky_blue
    sleep(1.seconds)
    @sobenme = '[why_sky_blue][after 😴 sleep 1 💤 mimicking a GenAI computation]'
    @answer = "Blue light is scattered in all directions by the tiny molecules of air in Earth's atmosphere. Blue is scattered more than other colors because it travels as shorter, smaller waves. This is why we see a blue sky most of the time."
    _common_answer(answer: @answer, sobenme: @sobenme)
    # respond_to do |format|
    #   format.json { render :json => {answer: @answer}  }
    #   format.html { nil }
    # end
  end


protected

  def _common_answer(answer: , sobenme: )
    @answer = answer
    @sobenme = sobenme
    calling_method = caller_locations(1,1)[0].label
    my_html_return =  "<div id='parent-div'>[_common_answer] GET /click @answer='#{@answer}' (calling_method='<b>#{calling_method}</b>')</div>"

    respond_to do |format|
      format.csv { render :csv => [[1,2,3]] }
      format.html { render :html => my_html_return}
      format.text { render :text => my_html_return}
      format.json { render :json => {
        answer: @answer,
        sobenme: @sobenme ,
        route: '_common_answer',
        caller: (caller.first.split(':')[0].split('/').last rescue :dunno),
        caller2: caller[0][/`.*'/][1..-2], # https://stackoverflow.com/questions/5100299/how-to-get-the-name-of-the-calling-method
        caller_ruby2: caller_locations(1,1)[0].label, # https://stackoverflow.com/questions/5100299/how-to-get-the-name-of-the-calling-method
        caller_ruby22: calling_method, # https://stackoverflow.com/questions/5100299/how-to-get-the-name-of-the-calling-method
      }
      }
    end
  end

end
