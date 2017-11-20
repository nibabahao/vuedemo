<template>
	<div class="wrap">
		<Headers :title="title"></Headers>
    <div class="basecontent">
      <ul class="list1">
        <li class="headPic" @click="upload">头像 <div><img src="../../assets/base_headpic.png" alt=""></div> </li>
        <li><a href="#">姓名 <em>李晓晓</em></a></li>
        <li><a href="#">会员标志 <i></i></a></li>
        <li><a href="#">联系方式 <em>13654301245</em></a></li>
      </ul>
      <ul class="list2">
        <li><a href="#">修改密码</a></li>
        <li><a href="#">修改钱包密码</a></li>
        <li><a href="#">我能供应</a></li>
      </ul>
    </div>
    <img-upload></img-upload>
	</div>
</template>
<script type="text/javascript">
   import Headers from '../../components/header'
   import imgUpload from '../../components/imgUpload'
   // import axios from 'axios'
   // import qs from 'qs'
   export default {
     name: 'index',
     data () {
       return {
         title: '基本资料'
       }
     },
     components: {
       Headers,
       imgUpload
     },
     methods: {
       upload () {
         this.$store.state.imguploadShow = true
       }
     },
     mounted () {
       console.log(this.$route.query.item)
     }
   }
</script>
<style type="text/css" scoped>
    .basecontent{margin-top: .768rem;}
    .list1{border-bottom: 1px solid #dedede; background-color: #FFF;}
    .basecontent li{height: .768rem; border-bottom: 1px solid #e7e7e7;text-align: left; padding-left: .17rem; box-sizing: border-box; line-height: .768rem; font-size: .256rem; color: #808080; position: relative;}
    .basecontent li:after {position: absolute; content: ""; width: .1024rem; height: 100%;top:0; content: ""; position: absolute; right: .17rem;background-image: url(../../assets/list_arrow.png); background-size: 100% auto; background-repeat: no-repeat;background-position: center;}
    .basecontent .headPic{ height: 1.28rem; line-height: 1.28rem; }
    .basecontent .headPic div{ width: .956rem; height: .956rem; position: absolute; right: .4594rem; top:0; top:.162rem; border-radius: 50%; overflow: hidden;}
    .basecontent .headPic div img{width: 100%;}
    .basecontent a{display: block; height: 100%; overflow: hidden;}
    .basecontent a em{float: right;margin-right: .4954rem;}
    .basecontent a i{float: right; width: .4096rem; height: 100%; background:url(../../assets/vipcharge.png) no-repeat; background-size: 100% auto; background-position: 0 center; margin-right: .4954rem;}
    .list2{background: #FFF; margin-top: .17rem;}
</style>