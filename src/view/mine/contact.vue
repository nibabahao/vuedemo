<template>
	<div class="wrap">
		<Headers :title="title"></Headers>
    <div class="namecontent">
       <input type="text" name="contact">
    </div>
	</div>
</template>
<script type="text/javascript">
   import Headers from '../../components/header'
   // import axios from 'axios'
   // import qs from 'qs'
   export default {
     name: 'index',
     data () {
       return {
         title: '联系方式'
       }
     },
     components: {
       Headers
     },
     methods: {

     },
     mounted () {
       console.log(this.$route.query.item)
     }
   }
</script>
<style type="text/css" scoped>
    .namecontent{margin-top: .768rem; overflow: hidden;}
    .namecontent input {width: 6.058rem; height: .768rem; border:1px solid #DBDBDB; border-radius: 5px; display: block; margin: .3584rem auto 1.408rem; text-indent: .2048rem; color:#3A3A3A;font-size:.256rem;}
</style>