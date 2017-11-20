<template>
	<div class="wrap">
		<Headers :title="title"></Headers>
    <div class="namecontent">
      <div class="group">
          <input type="text" name="nickname" placeholder="手机号码">
          <input type="text" name="code" class="code" placeholder="验证码">
          <span>获取验证码</span>
      </div>
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
    .namecontent .group{  margin: .3584rem auto .6144rem; position: relative;}
    .namecontent input {width: 6.058rem; height: .768rem; border:1px solid #DBDBDB; border-radius: 5px; display: block; margin:0 auto ; text-indent: .2048rem; color:#3A3A3A;font-size:.256rem;}
    .namecontent input.code{ border-top: none; }
    .namecontent .group span{position: absolute; display: block; width: 1.706rem; height: .597rem; background-color: #26C08A; font-size: .256rem; color:#FFF; line-height: .597rem; border-radius: 7px; bottom: .088rem; right: .259rem; cursor: pointer;}
    .namecontent button {width: 5.46rem; display: block; margin: 0 auto; height: .768rem; border-radius: 5px; background-color: #F29004; border:none; padding: 0; color: #FFF; font-size: .256rem;}
</style>