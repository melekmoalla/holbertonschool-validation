package main

import (
	"io/ioutil"
	"net/http"
	"net/http/httptest"
	"testing"

	"github.com/gin-gonic/gin"
)

func TestIntegration(t *testing.T) {
	// Create a new router instance
	router := setupRouter()

	// Create a new test HTTP server
	server := httptest.NewServer(router)
	defer server.Close()

	// Test the HealthCheckHandler
	t.Run("HealthCheckHandler", func(t *testing.T) {
		resp, err := http.Get(server.URL + "/healthcheck")
		if err != nil {
			t.Fatal(err)
		}
		defer resp.Body.Close()

		// Check the response status code
		if resp.StatusCode != http.StatusOK {
			t.Errorf("unexpected status code: got %d, want %d", resp.StatusCode, http.StatusOK)
		}

		// Read the response body
		body, err := ioutil.ReadAll(resp.Body)
		if err != nil {
			t.Fatal(err)
		}

		// Check the response body content
		expectedBody := "Server is healthy!"
		if string(body) != expectedBody {
			t.Errorf("unexpected response body: got %s, want %s", string(body), expectedBody)
		}
	})

	// Test the HelloHandler
	t.Run("HelloHandler", func(t *testing.T) {
		resp, err := http.Get(server.URL + "/hello?name=John")
		if err != nil {
			t.Fatal(err)
		}
		defer resp.Body.Close()

		// Check the response status code
		if resp.StatusCode != http.StatusOK {
			t.Errorf("unexpected status code: got %d, want %d", resp.StatusCode, http.StatusOK)
		}

		// Read the response body
		body, err := ioutil.ReadAll(resp.Body)
		if err != nil {
			t.Fatal(err)
		}

		// Check the response body content
		expectedBody := "Hello John!"
		if string(body) != expectedBody {
			t.Errorf("unexpected response body: got %s, want %s", string(body), expectedBody)
		}
	})
}

func setupRouter() *gin.Engine {
	router := gin.Default()

	router.GET("/healthcheck", HealthCheckHandler)
	router.GET("/hello", HelloHandler)

	return router
}

func HealthCheckHandler(c *gin.Context) {
	c.String(http.StatusOK, "Server is healthy!")
}

func HelloHandler(c *gin.Context) {
	name := c.Query("name")
	if name == "" {
		c.String(http.StatusBadRequest, "Name parameter is required")
		return
	}

	message := "Hello " + name + "!"
	c.String(http.StatusOK, message)
}
