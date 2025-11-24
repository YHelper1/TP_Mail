package main

import (
	"crypto/sha256"
	"fmt"
	"html/template"
	"log"
	"net/http"
	"os"

	"gorm.io/driver/sqlite"
	"gorm.io/gorm"
)

var database *gorm.DB

type account struct {
	gorm.Model
	Login    string
	Password string
}

var template_index = getTemplate("index.html")
var template_register = getTemplate("register.html")
var template_login = getTemplate("login.html")

func getTemplate(name string) template.Template {
	var template_ = template.Must(template.ParseFiles("templates/" + name))
	return *template_
}


func loginHandler(w http.ResponseWriter, r *http.Request) {
  //template_login.Execute(w, nil)
  w.WriteHeader(logIn(postFormGetAccountDetails(r)))
}

func logIn(login string, password string) int {
  var acc_ account;
  var acc = database.First(&acc_, "Login", login)
  if (acc.Error != nil) {
    return 404
  }
  if (acc_.Password == password) {
    return 202
  }
  
  return 403
}

func registerHandler(w http.ResponseWriter, r *http.Request) {
	//template_register.Execute(w, nil)
	w.WriteHeader(createAccount(postFormGetAccountDetails(r)))
}

func postFormGetAccountDetails(r *http.Request) (string, string) {
	return r.Header.Get("login"), r.Header.Get("password")
}

func createAccount(login string, password string) int {
  if (checkIsExist(login) != true) {
	  newAccount := account{Login: login, Password: password}
    fmt.Print(newAccount)
    database.Create(&newAccount)
    return 200
  }
  
  return 403
}

func checkIsExist(login string) bool {
  var acc_ account
  acc := database.First(&acc_, "Login", login)
  fmt.Print(acc.Error)
  if (acc.Error != nil){
    return false
  }
  return true
}

func main() {

	database = startDB()
	addTable(database, account{})
	port := os.Getenv("PORT")
	if port == "" {
		port = "3000"
	}

	mux := http.NewServeMux()

	mux.HandleFunc("/login", loginHandler)
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
	//dsn := "host=localhost port=5432 user=root dbname=Mails password=BKNVrGg942tetFMOhlGK sslmode=disable"
  createDBFile("AccMail")
	db, err := gorm.Open(sqlite.Open("AccMail.db"), &gorm.Config{})

	if err != nil {
    log.Fatal(err)
	}

	return db
}

func createDBFile(name string) {
  os.Create(name + ".db")
}

func addTable(db *gorm.DB, table interface{}) {
	db.AutoMigrate(&table)
}


