package main

import (
	"fmt"
	"io/ioutil"
	"net/http"
	"github.com/gorilla/mux"
)

func main() {
	r := mux.NewRouter()

	r.Queries("apikey, hash, ts, orderBy", "{[a-z0-9]*?}")
	r.HandleFunc("/characters", func(w http.ResponseWriter, r *http.Request) {
		handler(w, r, "MarvelAppTests/Mock/heroesList.json", 200)
	}).Methods("GET")

	http.Handle("/", r)
	http.ListenAndServe(":8080", r)
}

func handler(w http.ResponseWriter, r *http.Request, f string, c int) {
	file, err := ioutil.ReadFile(f)
	if err != nil {
		fmt.Print(err)
	}
	str := string(file)

	w.Header().Set("Content-Type", "application/gzip")
	w.WriteHeader(c)
	w.Write([]byte(str))

	return
}
