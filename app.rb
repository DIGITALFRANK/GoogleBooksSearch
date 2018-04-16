
require 'sinatra'
# require 'rubyjokes'
require 'googlebooks'

get '/' do 
    erb :index
end

post '/postroute' do 
    the_book = params[:the_book]
    @the_book = the_book
    @books  = GoogleBooks.search(the_book, {:count => 10})  # .first   or , {:count => 10}
    
    puts @books  

    @books.each do |key, value|
        puts key.image_link
        puts key.title
        puts key.description
    end


    erb :search_results
end



