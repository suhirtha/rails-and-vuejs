var vm = new Vue({
  el: '#company',
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