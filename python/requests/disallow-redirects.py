import requests

# ruleid: requests-disallow-redirects
requests.get("https://foo")

# ruleid: requests-disallow-redirects
requests.get("https://foo", allow_redirects=True)

params = {"allow_redirects": True}
# ruleid: requests-disallow-redirects
requests.get("https://foo", **params)

# ok: requests-disallow-redirects
requests.get("https://foo", allow_redirects=False)

session = requests.Session()
# ruleid: requests-disallow-redirects
session.get("https://foo")
# ruleid: requests-disallow-redirects
session.get("https://foo", allow_redirects=True)
# ok: requests-disallow-redirects
session.get("https://foo", allow_redirects=False)

# ruleid: requests-disallow-redirects
requests.post("https://foo")
# ruleid: requests-disallow-redirects
requests.request("GET", "https://foo")
# ruleid: requests-disallow-redirects
requests.get("https://foo")
# ruleid: requests-disallow-redirects
requests.post("https://foo")
# ruleid: requests-disallow-redirects
requests.put("https://foo")
# ruleid: requests-disallow-redirects
requests.delete("https://foo")
# ruleid: requests-disallow-redirects
requests.head("https://foo")
# ruleid: requests-disallow-redirects
requests.patch("https://foo")

