<template>
	<div class="mask" v-if="show" @click="shareHide">
		<div class="panel" @click.stop>
			<p>分享到</p>
			<ul class="clearfix">
				<li><a href="#">微信好友</a></li>
				<li class="mid"><a href="#">微信朋友圈</a></li>
				<li><a href="#">新浪微博</a></li>
			</ul>
			<button @click="shareHide">取&nbsp;消</button>
		</div>
	</div>
</template>
<script type="text/javascript">
   export default {
     name: 'share',
     data () {
       return {
       }
     },
     computed: {
       show () {
         return this.$store.state.shareShow
       }
     },
     methods: {
       shareHide () {
         this.$store.state.shareShow = false
       }
     }
   }
</script>
<style type="text/css" scoped>
   .mask{position: fixed; top:0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,.5); z-index: 5;}
   .mask .panel{position: absolute; bottom: 0; width: 100%; height: 4.01rem; background: #FFF; left: 0;box-sizing: border-box; padding: .3754rem;}
   .panel p{color:#262626; font-size: .2747rem; text-align: center;line-height: 1;}
   .panel ul{margin-top: .3413rem;}
   .panel ul li{width: 1.4rem; float: left; text-align: center;}
   .panel ul li a{display: block; width: 100%; height: 100%; color: #262626; font-size: .24rem;}
   .panel ul li a:before{display: block; content: ""; background: url(../assets/icon.png) no-repeat; height: 55px; width: 55px; margin:0 auto .17rem; background-size: 216px auto;}
   .panel ul li.mid{margin:0 .7246rem;}
   .panel ul li.mid a:before{background-position: -107px -24px;}
   .panel ul li:first-child a:before{background-position: -162px -24px;}
   .panel ul li:last-child a:before{background-position: -53px -24px;}
   .panel button{margin-top: .4256rem; width: ; height: .6656rem;width: 5.3589rem;background: #cccccc;padding: 0; text-align: center; line-height: .6656rem; color:#262626; font-size: .256rem;border:none; border-radius: 3px;}
</style>