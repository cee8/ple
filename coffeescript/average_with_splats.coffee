average = (a...) ->
  (a.reduce ((x, y) -> x + y), 0) / a.length

console.log average 7.5, 20, 6, -50, 88
console.log average()
