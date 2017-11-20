<template>
	<div class="wrap">
		<Headers :title="title"></Headers>
    <div class="namecontent">
       <input type="text" name="nickname">
       <button>确认</button> 
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
         title: '姓名'
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
    .namecontent button {width: 5.46rem; display: block; margin: 0 auto; height: .768rem; border-radius: 5px; background-color: #F29004; border:none; padding: 0; color: #FFF; font-size: .256rem;}
</style>