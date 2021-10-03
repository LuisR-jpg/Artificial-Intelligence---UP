
import requests

url_address = "https://api.zoom.us/v2/meetings/83300892376/recordings"
aT = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOm51bGwsImlzcyI6IlFNdWVVVEs5UnYyU1lLSEJYRW9zY3ciLCJleHAiOjE2MjY0NTU0MzAsImlhdCI6MTYyNTg1MDYyN30.LkLf0dKbFXDCcPsMcUDF3Zr7zZ16EjzSMApriWFle0k"
headers = {
    "Authorization": "Bearer " + aT,
    }

# find out total number of pages
r = requests.get(url=url_address, headers=headers).json()
#print(r['topic'])
print(r)

print("loooooooooooooooooooooool\n\n\n")
linkPrueba = ""
for i in r['recording_files']:
    print(i['download_url'])
    print(i['file_type'])
    if(i['file_type'] == 'MP4'):
        linkPrueba = i['download_url']
print("\n\n\n", linkPrueba)
rT = requests.get(url = linkPrueba + "?access_token=" + aT)
#print(rT)
with open("Edder-Banana.mp4",'wb') as f:
  
    # Saving received content as a png file in
    # binary format
  
    # write the contents of the response (r.content)
    # to a new file in binary mode.
    f.write(rT.content)
"""
total_pages = int(r['page_count']) + 1

# results will be appended to this list
all_entries = []

# loop through all pages and return JSON object
for page in range(1, total_pages):

    url = url_address + "?page_number=" + str(page)
    user_data = requests.get(url=url, headers=headers).json()
    user_ids = [(user['email']) for user in user_data['users']]
    all_entries.append(user_ids)
    page += 1
data = list(all_entries)

for email in data:
    print('Found User Account: {}'.format(email))




{
  "type": "object",
  "properties": {
    "include_fields": {
      "type": "string",
      "description": "Get the `download_access_token` field for downloading meeting recordings."
    },
    "ttl": {
      "type": "int",
      "maximum": 604800,
      "minimum": 0,
      "description": "Time to live (TTL) of the `download_access_token`. This is only valid if the `include_fields` query parameter contains `download_access_token`. The range is between 0-604800."
    }
  },
  "required": []
}
"""
