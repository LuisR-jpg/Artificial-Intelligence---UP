# imported the requests library
import requests
vid_url = "https://dl166.dlmate32.xyz/?file=M3R4SUNiN3JsOHJ6WWQ2a3NQS1Y5ZGlxVlZIOCtyZ1hpY0E3MUJob0k2cENwNE11bk5LcExjd0VIS0lDeEpLZFFvZ0U1WERWWVlUTk5nYUZzNmMyUTJlSnFwTnZueWJBNXBvMVc4dzBCREQxaTdMbXhCY256RlhUWjRyQUZLeFRJM1IwcmdzdW1EV0MyZkRIc1NyNnNuT3NxVXk4ZWkwRXR3UVpPUGpaNmFCNmczUDRlYzNPNUlBcGdCbk10TXBabFAyTjRFZnh4cjFqbGVRelcxeGtlb0pZelpQNDJxMmQ4eFZNMHNGT2l4ank3L0d2SEp0b1RmZlBMVzhwYW1RYS83TDhTa2xM"
  
# URL of the image to be downloaded is defined as image_url
r = requests.get(vid_url) # create HTTP response object
  
# send a HTTP request to the server and save
# the HTTP response in a response object called r
with open("Squash-Banana.mp4",'wb') as f:
  
    # Saving received content as a png file in
    # binary format
  
    # write the contents of the response (r.content)
    # to a new file in binary mode.
    f.write(r.content)
