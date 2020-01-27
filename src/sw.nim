import parseopt, random
from planet import getPlanet
from people import getPeople

randomize()

var p = initOptParser()
var commands = ["people", "planet", "help"]
var fullKeys = false
var command = ""

# Parsing command -----
while true:
    p.next()
    case p.kind
    of cmdEnd: break
    of cmdShortOption, cmdLongOption:
      if p.key == "full":
        fullKeys = true
      if p.val == "":
        echo "Option: ", p.key
      else:
        echo "Option and value: ", p.key, ", ", p.val
    of cmdArgument:
      if p.key notin commands:
        echo "The command", command, " is not supported."
        break
      else:
        if p.key == "planet":
          echo getPlanet()
        if p.key == "people":
          #echo getPeople(full = fullKeys)
          command = p.key
        if p.key == "help":
          command = "help"
        

# Do things with what has been parsed -----
if command == "people":
  if fullKeys:
    echo getPeople(full = fullKeys)
  else:
    echo getPeople()
if command == "help":
  echo """
sw - Query SWAPI, the Star Wars API
commands:
  planet
  people"""