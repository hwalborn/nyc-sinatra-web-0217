class ApplicationController < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views/") }
  register Sinatra::Twitter::Bootstrap::Assets

  patch '/figures/:id' do
    @figure = Figure.update(params[:id], params[:figure])
    @figure.landmarks << Landmark.create(params[:landmark])
    redirect to "/figures/#{@figure.id}"
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.update(params[:id], params[:landmark])
    redirect to "/landmarks/#{@landmark.id}"
  end
end
