import random, httpclient, strutils, json
from constants import randomPeopleMax, baseURL, peoplePath

let client = newHttpClient()

proc getPeople*(full: bool = false): string =
    var id = rand(randomPeopleMax)
    let res = client.getContent(baseURL & peoplePath & intToStr(id))
    let j = parseJson(res)
    if full:
        return pretty(j)
    else:
        return j["name"].getStr()