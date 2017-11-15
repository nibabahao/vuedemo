<template>
	<div class="wrap">
		<lHeader></lHeader>
    <div class="content">
      <img src="http://10.161.18.113:3000/assets/login_pichead.png">
      <input type="text" name="username" placeholder="请输入手机号/账号" class="username">
      <input type="password" name="psd" placeholder="请输入密码" class="psd">
      <a href="#" class="forget">忘记密码?</a>
      <button>登&nbsp;录</button>
    </div> 
	</div>
</template>
<script type="text/javascript">
   import lHeader from '../../components/lHeader'
   export default {
     name: 'index',
     data () {
       return {
       }
     },
     components: {
       lHeader
     }
   }
</script>
<style type="text/css" scoped>
   .content {margin: 1.391rem auto 0; text-align: center;}
   .content img{ display: block; margin:0 auto; width: 1.706rem;}
   .content input {width: 5.4613rem; height: .768rem;line-height: 1; padding:0 .73386rem; box-sizing: border-box; font-size: .239rem; border:none;border:1px solid #dbdbdb; border-radius: 5px;background-repeat:no-repeat;  background-size: .256rem auto; background-position: .256rem center;}
   .content input.username { background-image: url(../../assets/user_icon.png); margin-top: .6315rem;}
   .content input.psd { background-image: url(../../assets/psd_icon.png); margin-top: .2219rem;}
   input::-webkit-input-placeholder { color:#b9b9b9;}
   .forget {text-align: right; display: block; width: 5.4613rem; margin: .17rem auto 0; color: #f29004; font-size: .2048rem;}
   button {background: #f29004; color:#FFF; width: 5.4613rem; height: .768rem; font-size: .29rem;line-height: .768rem; box-sizing: border-box; border:none; margin-top: .5546rem; border-radius: 5px;}
</style>