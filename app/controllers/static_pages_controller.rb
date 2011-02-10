class StaticPagesController < ApplicationController
  @@Formats = { "html" => "text/html", "png" => "image/png", "jpg" => "image/jpg", "css" => "text/css", "json" => "text/json"  }
  def page

    send_file "#{Rails.root}/app/views/static_pages/venues/MassChallenge/rev_000000/#{params[:filename]}.#{params[:format]}",:disposition =>'inline', :type => @@Formats[params[:format]]
  end
end
