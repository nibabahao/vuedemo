<template>
	<div class="wrap">
		<lHeader></lHeader>
    <form class="loginWrap" @submit.prevent="submit">
      <div class="content">
        <img src="http://10.161.18.113:3000/assets/login_pichead.png">
        <div class="phone">
          <input type="text" name="username" placeholder="请输入手机号" class="username" v-model="username" v-validate="'required|phone'">
          <em v-show="errors.has('username')">{{ errors.first('username') }}</em>
        </div>
      <div class="psdGroup">
        <input type="password" class="psw" name="psw" placeholder="请输入密码" v-validate="'required|min:6'" v-model="psw">
        <em v-show="errors.has('psw')">{{errors.first('psw')}}</em>        
        <a href="#" class="forget">忘记密码?</a>
      </div>  
        <button>登&nbsp;录</button>
      </div>       
    </form>
	</div>
</template>
<script type="text/javascript">
   import Vue from 'vue'
   import lHeader from '../../components/lHeader'
   import VeeValidate, {Validator} from 'vee-validate'
   import zh from 'vee-validate/dist/locale/zh_CN'
   import axios from 'axios'
   import qs from 'qs'
   Vue.use(VeeValidate, {locale: 'zh'})
   Validator.addLocale(zh)
   Validator.extend('phone', {
     messages: {
       zh: '请输入正确手机'
     },
     validate: value => {
       const reg = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9]|17[0-9])\d{8}$/
       return reg.test(value)
     }
   })
   const dict = {
     zh: {
       custom: {
         username: {
           required: '手机不能为空'
         },
         psw: {
           required: '密码不能为空',
           min: '最少长度为6'
         }
       }
     }
   }
   Validator.updateDictionary(dict)
   export default {
     name: 'index',
     data () {
       return {
         username: '',
         psw: ''
       }
     },
     components: {
       lHeader
     },
     methods: {
       submit () {
         this.$validator.validateAll().then((result) => {
           if (result) {
             let _this = this
             axios.post('/login',
               qs.stringify({
                 username: _this.username,
                 psw: _this.psw
               }),
               {
                 headers: {
                   'Content-Type': 'application/x-www-form-urlencoded'
                 }
               })
               .then(res => {
                 alert(res.data.msg)
                 if (res.data.status) {
                   res.status && this.$router.push({path: 'person'})
                 }
               })
           }
         })
       }
     }
   }
</script>
<style type="text/css" scoped>
   .content {margin: 1.391rem auto 0; text-align: center;}
   .content img{ display: block; margin:0 auto; width: 1.706rem;}
   .content input {width: 5.4613rem; height: .768rem;line-height: 1; padding:0 .73386rem; box-sizing: border-box; font-size: .239rem; border:none;border:1px solid #dbdbdb; border-radius: 5px;background-repeat:no-repeat;  background-size: .256rem auto; background-position: .256rem center;}
   .content input.username { background-image: url(../../assets/user_icon.png);}
   .content input.psw { background-image: url(../../assets/psd_icon.png); }
   input::-webkit-input-placeholder { color:#b9b9b9;}
   .forget {text-align: right; display: block; width: 5.4613rem; margin: .17rem auto 0; color: #f29004; font-size: .2048rem;}
   button {background: #f29004; color:#FFF; width: 5.4613rem; height: .768rem; font-size: .29rem;line-height: .768rem; box-sizing: border-box; border:none; margin-top: .5546rem; border-radius: 5px;}
   .phone{position: relative; margin: .6315rem auto 0; width: 5.4613rem;}
   .psdGroup{position: relative; margin: .2219rem auto 0; width: 5.4613rem;}
  .content em{position: absolute; height: .768rem; right: 12px; top:0; line-height: .768rem; color: #ff3860;}
</style>