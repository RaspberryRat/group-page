import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ 'form', 'btn' ]

    show() {
        const filter_form = this.formTarget
        const button = this.btnTarget

        if (filter_form.classList.contains('hidden')) {
            filter_form.classList.remove('hidden')
            button.innerText = 'Hide Filters';
        } else {
            filter_form.classList.add('hidden');
            button.innerText = 'Show Filters';
        }
    }
}
