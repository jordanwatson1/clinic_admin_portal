import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("✅ Stimulus is working")
  }

  log() {
    console.log("✅ Button clicked")
    alert("Stimulus is alive!")
  }
}
