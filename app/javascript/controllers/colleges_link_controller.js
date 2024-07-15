// Very simple controller added for the sake of showing some JS.
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [
    "container"
  ]

  highlightSelected(e) {
    document.querySelector(".selected").classList.remove("selected")
    this.containerTarget.classList.add("selected")
  }
}
