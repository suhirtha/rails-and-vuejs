Vue.component('city-item', {
  props: ['a','b'],
 
  template: '\
   <input v-model.lazy= "a.name"  v-autocity="b"  v-on:keydown.enter="a.name = $event.target.value">\
  '
})