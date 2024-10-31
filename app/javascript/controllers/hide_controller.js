import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ['element', 'btn']

    show() {
        const element = this.elementTarget
        const button = this.btnTarget

        if (element.classList.contains('retract')) {
            element.classList.remove('retract')
            element.classList.add('expand')
            this.rename_button(button);
        } else if (element.classList.contains('expand')) {
            element.classList.remove('expand')
            element.classList.add('retract');
            this.rename_button(button);
        }
    }

    rename_button(button) {
        if (button.innerText === 'Hide Filters') {
            button.innerText = 'Show Filters';
        } else if (button.innerText === 'Show Filters') {
            button.innerText = 'Hide Filters';
        } else if (button.innerText === 'Show Pending Users') {
            button.innerText = 'Hide Pending Users';
        } else if (button.innerText === 'Hide Pending Users') {
            button.innerText = 'Show Pending Users';
        }
    }
}
