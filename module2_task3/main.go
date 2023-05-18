package main

import (
	"github.com/gin-gonic/gin"
)

func setupRouter() *gin.Engine {
	router := gin.Default()

	// Define your API routes here
	router.GET("/hello", HelloHandler)
	router.GET("/healthcheck", HealthCheckHandler)

	return router
}

	// Return status 400 if name is empty
	if name == "" {
		w.WriteHeader(400)
		return
	}

	// Write the string "Hello <name>" into the response's body
	_, _ = io.WriteString(w, fmt.Sprintf("Hello %s!", name))

	// Print a line in the ACCESS log
	fmt.Printf("HIT: hello handler with name %s \n", name)
}
