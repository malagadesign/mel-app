const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        // Aquí registramos la nueva fuente. 'sans' la define como la fuente por defecto.
        'sans': ['"Plus Jakarta Sans"', ...defaultTheme.fontFamily.sans],
      },
      colors: {
        // Aquí registramos tu paleta de colores personalizada.
        'brand': {
          'primary': '#81b829', // Verde principal
          'dark': '#043e22',    // Verde oscuro
          'medium': '#1a4f35',  // Verde medio
        },
        // También puedes añadir el color de fondo si quieres darle un nombre.
        'background': '#f8fafc', // Esto es el `slate-50` que estamos usando
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}