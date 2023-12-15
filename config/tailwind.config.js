const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    opacity: {
      '0': '0',
      '25': '.25',
      '50': '.5',
      '75': '.75',
      '85': '.85',
      '90': '.90',
      '95': '.95',
      '100': '1',
    },
    extend: {
      colors: {
        'red': {
          '100':'#ed2324',
          '50':'#a61919'
        },
        'black': '#2b2b2b',
      },
      fontFamily: {
        'poppins': ['Poppins', 'sans-serif']
      },
    },
    variants: {
      extend: {
        opacity: ['responsive', 'hover', 'focus', 'group-hover'],
        padding: ['group-hover'],
        divideColor: ['group-hover'],
      }
    }
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
