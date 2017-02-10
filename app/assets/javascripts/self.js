
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

var vm = new Vue({
  el: '#app',
  data: {
    company: [],
    rooms: [],
    areas: [],
    types: [],
    cities: [],
    cityarea: [],
    editRoom: true,
    editArea: true,
    editCompany: true,
  },
  created: function() {
    var that;
    console.log(this);
    that = this;
    $.ajax({
      url: '/companies/'+company_id+'.json',
      success: function(data) {
        that.company = data["details"]["name"];
        that.rooms = data["details"]["rates"];
        that.areas = data["details"]["areas"];
        that.types = data["types_list"];
        for(var i =0; i< data["cities_list"].length; i++){
          that.cities[i] = data["cities_list"][i]["name"];
        }
        for(var i = 0; i< data["areas_list"].length; i++){
          that.cityarea[i] = data["areas_list"][i]["name"];
        }
        
      }

    });
  }
});
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
