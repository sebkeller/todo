import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"

export default class extends Controller {
  connect() {
    this.sortable = Sortable.create(this.element, {
      group: 'shared',
      animation: 150,
      onEnd: this.end.bind(this)
    })
  }

  end(e) {
    const id = e.item.dataset.id
    const csrfToken = document.querySelector("[name='csrf-token']").content

    fetch(this.data.get("url").replace(":id", id), {
      method: 'PATCH',
      mode: 'cors',
      cache: 'no-cache',
      credentials: 'same-origin',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': csrfToken
      },
      body: JSON.stringify({ position: e.newIndex + 1 })
    })
      .then(response => response.json())
  }
}