#definition de la classe fonction
class Fonction
  attr_accessor :expression
  
  M = ['cos', 'sin', 'tan', 'exp', 'log', 'log10', 'sqrt', 'PI'].freeze

  #constructeur
  def initialize e
    self.expression = e
    traiter
  end

  #cette fonction calcule l'image d'un point
  def f x
    eval self.expression
  end

  #calcule les images des X compris dans min et max en progressant par pas de interval et retourne le resultat sous forme de tableau de hachage
  def fa min, max, interval=1
    tab = {}
    i = min
    while i <= max
      begin
        tab[i] = self.f(i)
      rescue
        tab[i] = nil
      end
      i += interval
    end
    tab
  end

  def abs x
    x.abs
  end

  def expression_orig
    expr = self.expression
    M.each { |e| expr = expr.gsub("Math.#{e}", e) }
    expr = expr.gsub("**", '^')
    return expr
  end

  private
  def traiter
    self.expression.gsub!('^','**')
    self.expression.gsub!('ln','log')
    M.each { |e| self.expression.gsub!(e, "Math.#{e}") }
  end
  
end