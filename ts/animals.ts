import { strict as assert } from "assert"

abstract class Animal {
  constructor(private readonly name: String) {}
  protected abstract sound(): String
  public speak(): String {
    return `${this.name} says ${this.sound()}`
  }
}

class Cow extends Animal {
  sound() {
    return "moooo"
  }
}

class Horse extends Animal {
  sound() {
    return "neigh"
  }
}

class Sheep extends Animal {
  sound() {
    return "baaaa"
  }
}

const horse = new Horse("CJ")
assert(horse.speak() === "CJ says neigh")
const cow = new Cow("Bessie")
assert(cow.speak() === "Bessie says moooo")
assert(new Sheep("Little Lamb").speak() === "Little Lamb says baaaa")
