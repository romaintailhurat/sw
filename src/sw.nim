import httpclient, json, parseopt, random, strutils
from planet import getPlanet

randomize()

# Const -----
let randomPeopleMax = 87 # --> https://swapi.co/api/people/
let baseURL = "https://swapi.co/api/"
let peoplePath = "people/"

var p = initOptParser()

let client = newHttpClient()

proc getPeople(): string =
  var id = rand(randomPeopleMax)
  let res = client.getContent(baseURL & peoplePath & intToStr(id))
  let j = parseJson(res)
  j["name"].getStr()

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