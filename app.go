package main

import (
	"log"
	"net/http"
)

func main() {
	http.Handle("/", http.FileServer(http.Dir("./static")))
	log.Println("Server listening at port 8000...")
	http.ListenAndServe(":8000", nil)
}
