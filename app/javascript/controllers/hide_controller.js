import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ 'element', 'btn' ]

    show() {
        const element = this.elementTarget
        const button = this.btnTarget

        if (element.classList.contains('hidden')) {
            element.classList.remove('hidden')
            this.rename_button(button);
        } else {
            element.classList.add('hidden');
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
