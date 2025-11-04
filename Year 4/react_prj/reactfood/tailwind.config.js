// /** @type {import('tailwindcss').Config} */
// export default {
//   content: [],
//   theme: {
//     extend: {},
//   },
//   plugins: [],
// }

module.exports = {
  content: [
    "./index.html",
    "./src/**/*.{js,jsx}",
    "./node_modules/flowbite-react/**/*.{js,jsx}"
  ],
  darkMode: 'class', // bật dark mode theo class
  theme: {
    extend: {},
  },
  plugins: [
    require('flowbite/plugin')
  ],
}