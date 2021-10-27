import requests

url_address = "https://api.zoom.us/v2/users"
headers = {
    "Authorization": "Bearer " + "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOm51bGwsImlzcyI6IlFNdWVVVEs5UnYyU1lLSEJYRW9zY3ciLCJleHAiOjE2MjU4NTEzNzUsImlhdCI6MTYyNTg0NTk3MX0.b1a1aDmTqYsdYdbwhPcOSAQXA6htKqNrH2MD0S709Xk",
    }

# find out total number of pages
r = requests.get(url=url_address, headers=headers).json()
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
