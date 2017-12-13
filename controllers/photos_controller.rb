class PhotosController < Sinatra::Base

  # sets root as the parent directory of the current file
  set :root, File.join(File.dirname(__FILE__), "..")
  set :views, Proc.new{File.join(root, "views")}

  configure :development do
    register Sinatra::Reloader
  end

  $photos = [{
  	id: 0,
  	title: "Photo 1",
  	body: "This is the first photo",
    source: "https://i.pinimg.com/736x/da/8e/fc/da8efc68a9eb13b228eee3609962a1a5--cute-dog-costumes-puppy-costume.jpg"
  },
  {
    id: 1,
    title: "Photo 2",
    body: "This is the second photo",
    source: "https://i.pinimg.com/736x/be/82/15/be821544fc5f328567cb538f96edb49a--snowball-too-cute.jpg"
  },
  {
    id: 2,
    title: "Photo 3",
    body: "This is the third photo",
    source: "http://vignette4.wikia.nocookie.net/lotrminecraftmod/images/3/32/Cute-Dog-dogs-13286656-1024-768.jpg/revision/latest?cb=20150222011858"
  }];

  get "/" do
    @title = "Photo Homepage"
    erb :"photos/home"
  end

  get "/photos" do
    @title = "Photos"
    @photos = $photos
    erb :"photos/index"
  end

  post "/photos" do
    "Creates new photos"
  end

  get "/photos/new" do
    @title = "New Photo Form"
    erb :"photos/newphoto"
  end

  get "/photos/:id" do
    id = params[:id].to_i
    @photo = $photos[id]
    erb :"photos/show"
  end

  get "/photos/:id/edit" do
    id = params[:id].to_i
    @photo = $photos[id]
    @title = "Edit photo"
    erb :"photos/edit"
  end

  put "/photos/:id" do
    id = params[:id]
    "Updates photo #{id}"
  end

  delete "/photos/:id" do
    id = params[:id]
    "Deletes photo #{id}"
  end
end
