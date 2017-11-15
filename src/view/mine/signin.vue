<template>
	<form class="signinWrap" @submit.prevent="submit">
		<Headers :title="title"></Headers>
    <div class="content">
      <div class="phone">
        <input type="text" name="username" placeholder="请输入手机号" class="username" v-model="username" v-validate="'required|phone'">
        <em v-show="errors.has('username')">{{ errors.first('username') }}</em>
      </div>
      <div class="code">
         <input type="text" name="code" placeholder="请输入验证码" >
         <span>点击发送</span>
      </div>
      <div class="psdGroup">
        <input type="password" class="psw" name="psw" placeholder="请设置密码" v-validate="'required|min:6'" v-model="psw">
        <em v-show="errors.has('psw')">{{errors.first('psw')}}</em>
        <input type="password" name="pswCheck"  class="pswCheck" placeholder="请再次输入密码" v-model="pswCheck">
      </div>
      <button>注&nbsp;册</button>
    </div> 
	</form>
</template>
<script type="text/javascript">
   import Vue from 'vue'
   import VeeValidate, {Validator} from 'vee-validate'
   import zh from 'vee-validate/dist/locale/zh_CN'
   import Headers from '../../components/header'
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
         title: '注册',
         username: '',
         psw: '',
         pswCheck: ''
       }
     },
     components: {
       Headers
     },
     methods: {
       submit () {
         this.$validator.validateAll().then((result) => {
           if (result) {
             this.psw === this.pswCheck && (() => {
               let _this = this
               axios.post('/register',
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
                   console.log(res)
                 })
             })()
           }
         })
       }
     }
   }
</script>
<style type="text/css" scoped>
   .content {margin: 1.322rem auto 0; text-align: center;}
   .content input {width: 5.4613rem; height: .768rem;line-height: 1; padding:0 .273rem; box-sizing: border-box; font-size: .239rem; border:none;border:1px solid #dbdbdb; border-radius: 5px;background-repeat:no-repeat;  background-size: .256rem auto; background-position: .256rem center;}
   .content .phone{position: relative; width: 5.4613rem; margin:0 auto;}
   .content .code{width: 5.4613rem; margin: .234rem auto 0; overflow: hidden; position: relative;}
   .content .code input{ width:3.6352rem; float: left;}
   .content .code span { width:1.6043rem; float: right; text-align: center; background-color: #ea6c6c; border-radius: 5px; color:#FFF; line-height: .768rem; font-size: .239rem;}
   .psdGroup {width: 5.4613rem; margin: .234rem auto 0; border-radius: 5px; border:1px solid #dbdbdb; position: relative;}
   .psdGroup:before { position: absolute; display: block; content: ""; width: 5.1626rem; height: 1px; background: #dbdbdb; top:50%; left: 50%; margin: -.5px 0 0 -2.5813rem; }
   .psdGroup input {border:none;}
   input::-webkit-input-placeholder { color:#b9b9b9;}
   .forget {text-align: right; display: block; width: 5.4613rem; margin: .17rem auto 0; color: #f29004; font-size: .2048rem;}
   button {background: #f29004; color:#FFF; width: 5.4613rem; height: .768rem; font-size: .29rem;line-height: .768rem; box-sizing: border-box; border:none; margin-top: 1.8432rem; border-radius: 5px;}
   .content .is-danger{border-color: #ff3860;}
   .content em{position: absolute; height: .768rem; right: 12px; top:0; line-height: .768rem; color: #ff3860;}
</style>