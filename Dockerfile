# Use the official Golang image as the base image
FROM golang:1.20.3

# Set the working directory
WORKDIR /app

# Copy go.mod and go.sum files
COPY go.mod go.sum ./

# Download dependencies
RUN go mod download

# Copy the source code
COPY src/ ./src/

# Build the Go app
RUN go build -o main ./src/

# Expose the port the app will run on
EXPOSE 8080

# Run the app
CMD ["./main"]
