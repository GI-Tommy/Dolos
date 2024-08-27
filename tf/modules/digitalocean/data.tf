data "http" "myip_json" {
  url = "https://ipinfo.io/json"
}
# Returns the follow data as an example:
# {
#     "ip": "8.8.8.8",
#     "hostname": "dns.google",
#     "anycast": true,
#     "city": "Mountain View",
#     "region": "California",
#     "country": "US",
#     "loc": "37.4056,-122.0775",
#     "org": "AS15169 Google LLC",
#     "postal": "94043",
#     "timezone": "America/Los_Angeles",
#     "readme": "https://ipinfo.io/missingauth"
# }
