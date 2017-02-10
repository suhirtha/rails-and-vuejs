
Vue.directive('autocity',{
           bind: function (el,binding) {
           console.log(binding.value)
            $(el).autocomplete({
               source: binding.value,
               minLength: 2,
                select: function(event, ui) {
                 console.log('bind',ui.item.value)
                 $(el).val(ui.item.value)
               }
              })
          },
        update: function (el,value) {
          $(el).autocomplete('destroy')
            $(el).autocomplete({
               source: value.value,
               minLength: 2,
                select: function(event, ui) {
                 console.log('update',ui.item.value)
                 
               }
            })
          }
})
Vue.directive('autoarea',{
           bind: function (el,binding) {
           console.log(binding.value)
            $(el).autocomplete({
               source: binding.value,
               minLength: 2,
                select: function(event, ui) {
                 console.log(ui)
               }
            })
          },
        update: function (el,value) {
          $(el).autocomplete('destroy')
            $(el).autocomplete({
               source: value.value,
               minLength: 2,
                select: function(event, ui) {
                 console.log(ui)
                 $(el).val(ui.item.value)
               }
            })
          }
})

Vue.component('area-item', {
  props: ['a','cityareas'],
 
  template: '\
   <input v-model.lazy="a.name" v-autoarea="cityareas" v-on:keydown.enter="a.name = $event.target.value">\
  '
})
Vue.component('city-item', {
  props: ['a','b'],
 
  template: '\
   <input v-model.lazy= "a.name"  v-autocity="b"  v-on:keydown.enter="a.name = $event.target.value">\
  '
})
