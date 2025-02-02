import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    if (!this.element.id) this.element.id = "theme-toggle"
    this.initializeTheme()
  }

  toggleTheme() {
    if (document.documentElement.classList.contains('dark')) {
      document.documentElement.classList.remove('dark')
      localStorage.theme = 'light'
    } else {
      document.documentElement.classList.add('dark')
      localStorage.theme = 'dark'
    }
  }

  initializeTheme() {
    // Update button state based on current theme
    const isDark = document.documentElement.classList.contains('dark')
    const darkIcon = document.getElementById('theme-toggle-dark-icon')
    const lightIcon = document.getElementById('theme-toggle-light-icon')
    
    if (isDark) {
      darkIcon?.classList.add('hidden')
      lightIcon?.classList.remove('hidden')
    } else {
      lightIcon?.classList.add('hidden')
      darkIcon?.classList.remove('hidden')
    }
  }
}