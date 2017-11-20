<template>
	<div class="header">
    <a href="javascript:void(0)" class="back" @click="back"></a>
		<h1>登录</h1>
    <router-link to="/signin" class="btngroup">注册</router-link>
	</div>
</template>
<script type="text/javascript">
   export default {
     data () {
       return {
         isTop: 1
       }
     },
     methods: {
       back () {
         this.$router.push({path: '/index'})
       },
       share () {
         this.$store.state.shareShow = true
       }
     },
     mounted () {
     }
   }
</script>
<style type="text/css" scoped>
	.header{position: fixed;top:0;left: 0;width: 100%;height: .768rem; z-index:2;max-width: 6.4rem;left: 50%;margin-left: -3.2rem; background-color: #f29004;}
	.back{float: left;width: 1.6rem;text-align: left;height: 100%;line-height: .768rem;box-sizing: border-box;padding-left: .18rem;font-size: .26rem; color: #FFF;}
	.back:after{display: inline-block;content:"";height: 100%;width: .4rem;background: url(../assets/back_arrow.png) no-repeat; background-size: .1792rem auto;vertical-align: middle; background-position: left center; }
  .btngroup{float: left;width: 1.6rem;text-align: right;padding-right: .18rem;box-sizing: border-box;height: .768rem; font-size: .273rem; color: #FFF; line-height: .768rem;}
	.header h1{width: 3.2rem;height: 100%;line-height: .768rem;text-align: center;color: #FFF;font-size: .3rem;float: left}
</style>