class FacebooksController < ApplicationController
  def canvas
      @oauth = Koala::Facebook::OAuth.new(APP_ID, APP_SECRET, root_url.chop+facebooks_callback_path+"/")
      session['oauth'] = @oauth
  end
  
  def index
    if session['oauth'].blank?
      redirect_to facebooks_canvas_path
    else
      @graph = Koala::Facebook::GraphAPI.new(session['access_token'])
    end
  end

  def logout
    session['oauth'] = nil
    session['access_token'] = nil
    redirect_to facebooks_index_path
  end

  def callback
    session['access_token'] = session['oauth'].get_access_token(params[:code])
    redirect_to facebooks_index_path
  end

end
