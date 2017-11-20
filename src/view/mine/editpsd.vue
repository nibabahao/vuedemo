<template>
	<div class="wrap">
		<Headers :title="title"></Headers>
    <div class="namecontent">
      <div class="group">
          <input type="text" name="psd" placeholder="6-20字符">
          <label for="psd">当前密码</label>
      </div>    
      <div class="group group-new">
          <input type="text" name="newpsd" placeholder="6-20字符">
          <label for="psd">新密码</label>
          <input type="text" name="checkpsd" class="code" placeholder="6-20字符">
          <label for="checkpsd">确认密码</label>
      </div>
      <p>注意：密码不得填写空格，可由英文文字和数字组成</p>
       <button>确认</button> 
    </div>
	</div>
</template>
<script type="text/javascript">
   import Headers from '../../components/header'
   // import axios from 'axios'
   // import qs from 'qs'
   export default {
     name: 'editpsd',
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
    .namecontent .group{  margin: .3584rem auto .256rem; position: relative; width: 6.058rem;}
    .namecontent input {width: 6.058rem; height: .768rem; border:1px solid #DBDBDB; border-radius: 5px; display: block; margin:0 auto ; text-indent: 2.2rem; color:#3A3A3A;font-size:.256rem;}
    .namecontent .group label{width: 2.2rem; height: .768rem; position: absolute; left: 0; top:0; line-height: .768rem; font-size: .256rem; color: #808080; text-indent: .238rem; text-align: left;}
    .namecontent .group-new label:last-child{top:.769rem;}
    .namecontent p{ color:#888888; font-size: .187rem;text-align: left; width: 6.058rem; margin: 0 auto;  margin-bottom: 5.12rem; }
    .namecontent input.code{ border-top: none; }
    .namecontent button {width: 5.46rem; display: block; margin: 0 auto; height: .768rem; border-radius: 5px; background-color: #F29004; border:none; padding: 0; color: #FFF; font-size: .256rem;}
</style>