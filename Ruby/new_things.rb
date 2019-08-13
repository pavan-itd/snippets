# Hash methods
h = {
  1: 2,
  2: 3,
  3: 10,
  4: 24
}

# Add new key-value pair
h.store(5, 50)
# Delete key-value pair
h.delete(1)

h.keep_if { |key, value| key.even? }
h.delete_if { |key, value| key.even? }

