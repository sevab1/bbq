require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

var jQuery = require('jquery')

// require("bootstrap")
import 'bootstrap/dist/js/bootstrap'
import '../styles/application.scss'

const images = require.context('../images', true)
