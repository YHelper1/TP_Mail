package main

import (
	"crypto/sha256"
	"html/template"
	"log"
	"net/http"
	"os"

	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

var database *gorm.DB

type account struct {
	gorm.Model
	login    string `gorm:"uniqueIndex"`
	password [32]byte
}

var template_index = getTemplate("index.html")
var template_register = getTemplate("register.html")

func getTemplate(name string) template.Template {
	var template_ = template.Must(template.ParseFiles("templates." + name))
	return *template_
}

func indexHandler(w http.ResponseWriter, r *http.Request) {
	template_index.Execute(w, nil)
}

func registerHandler(w http.ResponseWriter, r *http.Request) {
	template_register.Execute(w, nil)
	createAccount(postFormGetAccountDetails(r))
}

func postFormGetAccountDetails(r *http.Request) (string, string) {
	return r.PostForm.Get("login"), r.PostForm.Get("password")
}

func createAccount(login string, password string) {
	newAccount := account{login: login, password: getHash(getBytes(password))}
	database.Create(&newAccount)
}

func main() {

	database = startDB()
	addTable(database, account{})
	port := os.Getenv("PORT")
	if port == "" {
		port = "3000"
	}

	mux := http.NewServeMux()

	mux.HandleFunc("/", indexHandler)
	mux.HandleFunc("/register", registerHandler)
	http.ListenAndServe(":"+port, mux)
}

func getBytes(string_ string) []byte {
	return []byte(string_)
}

func getHash(bytePassword []byte) [32]byte {
	return sha256.Sum256(bytePassword)
}

func startDB() *gorm.DB {
	dsn := "host=localhost port=54560 user=root dbname=Mails password=aabad77c-1f51-48af-b652 sslmode=disable"
	db, err := gorm.Open(postgres.Open(dsn), &gorm.Config{})

	if err != nil {
		log.Fatal(err)
	}

	return db
}

func addTable(db *gorm.DB, table interface{}) {
	db.AutoMigrate(&table)
}
