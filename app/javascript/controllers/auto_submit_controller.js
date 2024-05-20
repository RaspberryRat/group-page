import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ['submit']
    connect() {
        console.log('Autosubmit controller connceted')
    }

    click() {
        this.submitTarget.click();
    }
}
