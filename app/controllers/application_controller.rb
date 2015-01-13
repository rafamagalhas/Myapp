class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session['user_id']) if session['user_id']
  end
  helper_method :current_user

  def logged_in?
  	if current_user!=nil
  		return true
  	else
  		return false
  	end
  end
  helper_method :logged_in?

  def require_login
  	unless logged_in?
  	    flash[:error]= 'Você precisa estar autenticado!'
  		redirect_to '/'
  	end
  end
  helper_method :require_login

  def load_actiondispatch_file!(actiondispatch,target_folder,field)
    FileUtils.mkdir_p(target_folder) unless File.exist?(target_folder)
    begin
      file = File.open("#{target_folder}/#{field.to_s}",'w:ASCII-8BIT:UTF-8')
      file.write(actiondispatch.read)
    ensure
      file.close
    end
  end
  helper_method :load_actiondispatch_file!
end

