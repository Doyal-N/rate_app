import App from '../app'

document.addEventListener('DOMContentLoaded', () => {
  const app = new App({
    target: document.body

  });

  window.app = app;
})
