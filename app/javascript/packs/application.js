// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");

import $ from 'jquery';
window.jQuery = $;
window.$ = $;

require('bootstrap');
require('popper.js');
require('@fortawesome/fontawesome-free/js/all');
FontAwesome.config.mutateApproach = 'sync';


import betterNav from "../js/better-nav";
import './styles.scss'

document.addEventListener('turbolinks:load', function(){
  betterNav();
});

var words = ['Фотограф', 'Аниматор', 'Фокусник', 'Видеограф', 'Ресторан', 'Батут', 'Ведущий', 'Музыка', 'Фотобудка'];
var count = 0;
setInterval(function(){
  $('#change').fadeOut(400, function(){
    count++;
    $(this).text(words[count % words.length]).fadeIn(400);
  });
  console.log('Done')
}, 2000);






// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
