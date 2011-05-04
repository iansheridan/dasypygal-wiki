# routes.rb file ====================================================

  get '/wiki/' do
    @pagename = 'Home'
    @wikipage = Wiki.wiki.page(@pagename)
    @output = @wikipage.formatted_data
    erb :page
  end

  get '/wiki/:page' do
    @pagename = params[:page].nil? ? 'Home' : params[:page]
    @wikipage = Wiki.wiki.page(@pagename)
    redirect '/wiki/' if @wikipage.nil?
    @output = @wikipage.formatted_data
    erb :page
  end

  get '/wiki/images/:image' do
    File.read(File.join( Wiki.root, "public", "images", params[:image] ))
  end