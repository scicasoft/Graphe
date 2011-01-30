require 'sinatra'
#gem qui interprete les fichiers erb
require 'erb'
#gem qui interprete les fichiers sass
require 'sass'
#on importe le fichier fonction o? se trouve la classe Fonction
require 'fonction'

#feuille de style
get '/style.css' do
  sass :style, :style => :expanded
end

#la page d'accueil
get '/' do
  #longueur de la zone de dessin en pixel
  @longueur = 800
  #hauteur de la zone de dessin en pixel
  @hauteur = 400
  #la X min
  @minX = -10
  #le X max
  @maxX = 10
  #le Y min
  @minY = -5
  #le Y max
  @maxY = 5
  #on cree un objet fonction avec la fonction ? tracer
  @fn = Fonction.new(params[:f] || '0')
  #on calcule l'image de chaque point de l'interval
  @points = @fn.fa(@minX, @maxX, 0.05)
  #on appel le fichier /views/index.erb
  erb :index
end