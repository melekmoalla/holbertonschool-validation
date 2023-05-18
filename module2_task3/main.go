package main

import (
	"fmt"
	"io"
	"net/http"

	"github.com/gin-gonic/gin"
)

func setupRouter() *gin.Engine {
	router := gin.Default()

	router.GET("/hello", HelloHandler)
	router.GET("/healthcheck", HealthCheckHandler)

	return router
}

func HelloHandler(c *gin.Context) {
	name := c.Query("name")

	// Return status 400 if name is empty
	if name == "" {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Name parameter is missing"})
		return
	}

	// Write the string "Hello <name>" into the response's body
	c.JSON(http.StatusOK, gin.H{"message": fmt.Sprintf("Hello %s!", name)})
}

func HealthCheckHandler(c *gin.Context) {
	c.JSON(http.StatusOK, gin.H{"status": "OK"})
}

func main() {
	router := setupRouter()
	router.Run(":8080")
}
