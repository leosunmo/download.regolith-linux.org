package main

import (
	"html/template"
	"io/ioutil"
	"log"
	"os"

	"gopkg.in/yaml.v2"
)

// Release represents all info and links for a Regolith release
type Release struct {
	Title           string   `yaml:"title"`
	ISODownloadLink string   `yaml:"isoDownloadLink"`
	MD5DownloadLink string   `yaml:"md5DownloadLink"`
	Mirrors         []string `yaml:"mirrors"`
}

// Releases is the list of releases and associated metadata
type Releases struct {
	Releases []Release `yaml:"releases"`
	BaseURL  string    `yaml:"baseUrl"`
}

func main() {
	tmpl := template.Must(template.ParseFiles("tpl/index.html.tpl"))

	outputFile, err := os.Create("index.html")
	if err != nil {
		log.Fatalf("failed to create file: %s", err)
	}
	defer outputFile.Close()

	yamlFile, err := ioutil.ReadFile("releases.yaml")
	if err != nil {
		log.Fatalf("failed to read yaml: %s", err)
	}
	releases := Releases{}
	err = yaml.Unmarshal(yamlFile, &releases)
	if err != nil {
		log.Fatalf("failed to unmarshal file: %s", err)
	}

	tmpl.Execute(outputFile, releases)
}
