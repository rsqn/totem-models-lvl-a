package authz

import "testing"

func TestHello(t *testing.T) {
	v := Hello("bob")
	expected := "Hi, bob. Welcome!"

	if v != expected {
		t.Errorf("Hello was incorrect, got: %s, want: %s.", v, expected)
	}
}
