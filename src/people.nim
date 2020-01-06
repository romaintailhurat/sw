import random, httpclient, strutils, json
from constants import randomPeopleMax, baseURL, peoplePath

let client = newHttpClient()

proc getPeople*(): string =
    var id = rand(randomPeopleMax)
    let res = client.getContent(baseURL & peoplePath & intToStr(id))
    let j = parseJson(res)
    j["name"].getStr()