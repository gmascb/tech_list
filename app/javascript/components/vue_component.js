import Vue from "vue"

new Vue({
  el: "#app-4",
  data: {
    todos: [
      { text: "Learn Rails" },
      { text: "Learn JS" },
      { text: "Learn Vue" }      
    ]
  }

})

new Vue({
  el: "#app-5",
  data: {
    message: "Hello Vuejs!!"
  },
  methods: {
    reverseMsg: function() {
      console.log("Hellow reverseMessage")
      this.message = this.message.split(' ').reverse().join(' ')
    }
  }
})