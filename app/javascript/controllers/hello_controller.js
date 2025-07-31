import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("✅ HelloController connected")
    alert("Stimulus is working via esbuild!")
  }
}
