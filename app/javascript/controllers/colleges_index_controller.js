import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    document.querySelector(".college-block").classList.add("selected")
  }
}
