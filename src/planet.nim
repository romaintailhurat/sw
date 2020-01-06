import random, httpclient, strutils, json
from constants import randomPlanetMax, baseURL, planetPath

let client = newHttpClient()

proc getPlanet*(): string =
    var id = rand(randomPlanetMax)
    let res = client.getContent(baseURL & planetPath & intToStr(id)) 
    let j = parseJson(res)
    j["name"].getStr()