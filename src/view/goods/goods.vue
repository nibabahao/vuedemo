<template>
	<div class="wrap">
    <router-view></router-view>
	</div>
</template>
<script type="text/javascript">
   export default {
     name: 'index',
     data () {
       return {
         cid: this.$store.state.cid
       }
     }
   }
</script>
<style type="text/css">
  .wrap{padding-bottom: 50px;}
</style>