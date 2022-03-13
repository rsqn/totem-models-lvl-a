package authz

import "fmt"

// Hello returns a greeting for the named person.
func Hello(name string) string {
	// Return a greeting that embeds the name in a message.
	message := fmt.Sprintf("Hi, %v. Welcome!", name)
	return message
}

func Echo(name string) string {
	// Return a greeting that embeds the name in a message.
	message := fmt.Sprintf("Echo %v", name)
	return message
}
