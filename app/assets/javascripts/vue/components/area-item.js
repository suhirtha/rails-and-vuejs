Vue.component('area-item', {
  props: ['a','cityareas'],
 
  template: '\
   <input v-model.lazy="a.name" v-autoarea="cityareas" v-on:keydown.enter="a.name = $event.target.value">\
  '
})