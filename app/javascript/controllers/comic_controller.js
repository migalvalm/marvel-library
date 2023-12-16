import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['heartImage']

  connect() {
    this.element.addEventListener('click', this.handleClick)
  }

  disconnect() {
    this.element.removeEventListener('click', this.handleClick)
  }

  handleClick = (event) => {
    event.preventDefault()
    const comicId = this.element.dataset.comicId
    const favorites = this.getFavoritesFromCookies() || []
    const isFavorited = favorites.includes(comicId)
    const heartImage = this.heartImageTarget

    if (isFavorited) {
      console.log(favorites)
      console.log(comicId)
      this.setFavoritesInCookies(favorites.filter(id => id !== comicId))
      heartImage.style.backgroundImage = "url('/assets/heart_off')"
    } else {
      console.log(favorites)
      console.log(comicId)
      this.setFavoritesInCookies([...favorites, comicId])
      heartImage.style.backgroundImage = "url('/assets/heart_on')"
    }
  }

  getFavoritesFromCookies() {
    console.log(document.cookie)
    const favoritesCookie = document.cookie.split('; ').find(row => row.startsWith('favorites='))
    return favoritesCookie ? JSON.parse(favoritesCookie.split('=')[1]) : []
  }

  setFavoritesInCookies(favorites) {
    document.cookie = `favorites=${JSON.stringify(favorites)}; path=/`
  }
}
