class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hello
  	render text: 
  		"<h1>Saver: Helping you reach (and savor) your financial goals</h1>
  			<p>Which of these is a goal you'd like to achieve?</p>
  			<li>Paying off my student loan</li>
  			<li>Buying a house</li>
  			<li>Saving for retirement</li>"
  end
end
