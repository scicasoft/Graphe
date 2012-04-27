require 'rubygems'
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
  @longueur = (params[:longueur] || 800).to_f
  #hauteur de la zone de dessin en pixel
  @hauteur = (params[:hauteur] || 400).to_f
  #la X min
  @minX = (params[:minx] || -10).to_f
  #le X max
  @maxX = (params[:maxx] || 10).to_f
  #le Y min
  @minY = (params[:miny] || -5).to_f
  #le Y max
  @maxY = (params[:maxy] || 5).to_f
  #on cree un objet fonction avec la fonction ? tracer
  @fn = Fonction.new(params[:f] || '0')
  #on calcule l'image de chaque point de l'interval
  @points = @fn.fa(@minX, @maxX, 0.05)
  #on appel le fichier /views/index.erb
  erb :index
end