import random, httpclient, strutils, json, strformat
from constants import randomPeopleMax, baseURL, peoplePath

let client = newHttpClient()

proc getPeople*(full: bool = false): string =
    var id = rand(randomPeopleMax)
    let res = client.getContent(baseURL & peoplePath & intToStr(id))
    let j = parseJson(res)
    if full:
        # {} instead of [] return a default value if nil
        let name = j{"name"}.getStr()
        let height = j{"height"}.getStr()
        return &"""Name: {name}
        Height: {height}"""
    else:
        return j["name"].getStr()