package main

import (
   "io/ioutil"
   "log"
   "net/http"
)

func main() {
   resp, err := http.Get("https://adeb-2806-103e-16-d11d-d355-1116-51ed-deb2.ngrok.io/hello")
   if err != nil {
      log.Fatalln(err)
   }
   body, err := ioutil.ReadAll(resp.Body)
   if err != nil {
      log.Fatalln(err)
   }
   sb := string(body)
   log.Printf(sb)
}