import parseopt, random
from planet import getPlanet
from people import getPeople

randomize()

var p = initOptParser()
var commands = ["people", "planet"]
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
      if p.key == "planet":
        echo getPlanet()
      if p.key == "people":
        #echo getPeople(full = fullKeys)
        command = p.key

# Do things with what has been parsed
if command notin commands:
  echo "The command ", command, " is not supported."
if command == "people":
  if fullKeys:
    echo getPeople(full = fullKeys)
  else:
    echo getPeople()