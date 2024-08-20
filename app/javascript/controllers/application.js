import { Application } from "@hotwired/stimulus"
import 'core-js/stable'
import 'regenerator-runtime/runtime'


const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
