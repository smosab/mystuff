

def fibonacci(n)

  phi = (1+Math.sqrt(5)) / 2

  _phi = (1-Math.sqrt(5)) / 2

  an = ((phi ** n) - (_phi ** n)) / Math.sqrt(5)

end