<template>
  <div id="app">
    <layout-header></layout-header>
    <flash-message></flash-message>
    <router-view></router-view>
    <layout-footer></layout-footer>
  </div>
</template>



<script>
  import layoutHeader from './components/layout/layoutHeader'
  import layoutFooter from './components/layout/layoutFooter'

  export default {
    name: "App",
    data: function () {
      return {
        message: "Hello Vue!",
        h1: "<h1>something</h1>"
      }
    },
    components: {
      layoutHeader,
      layoutFooter
    }
  }
</script>





<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
