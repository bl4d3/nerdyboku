class FacebooksController < ApplicationController
  def index
    if session['oauth'].blank?
      @oauth = Koala::Facebook::OAuth.new(APP_ID, APP_SECRET, root_url.chop+facebooks_callback_path+"/")
      session['oauth'] = @oauth
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
