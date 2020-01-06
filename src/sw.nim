import parseopt, random
from planet import getPlanet
from people import getPeople

randomize()

# Const -----
var p = initOptParser()

# Parsing cmd
while true:
    p.next()
    case p.kind
    of cmdEnd: break
    of cmdShortOption, cmdLongOption:
      if p.val == "":
        echo "Option: ", p.key
      else:
        echo "Option and value: ", p.key, ", ", p.val
    of cmdArgument:
      if p.key == "planet":
        echo getPlanet()
      if p.key == "people":
        echo getPeople()