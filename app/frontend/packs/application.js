require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import 'bootstrap/dist/js/bootstrap'

import '../styles/application.scss'

const images = require.context('../images', true)
