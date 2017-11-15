<template>
	<div class="header">
    <a href="javascript:void(0)" class="back" @click="back"></a>
		<h1>{{title}}</h1>
	</div>
</template>
<script type="text/javascript">
   export default {
     data () {
       return {

       }
     },
     props: ['title'],
     computed: {
       area () {
         let location = '广州'
         return location
       }
     },
     methods: {
       back () {
         this.$router.go(-1)
       }
     }
   }
</script>
<style type="text/css" scoped>
	.header{position: fixed;top:0;left: 0;width: 100%;height: .768rem;background: #f29004; z-index:2;max-width: 6.4rem;left: 50%;margin-left: -3.2rem;}
	.back{float: left;width: 1.6rem;text-align: left;height: 100%;line-height: .768rem;box-sizing: border-box;padding-left: .18rem;font-size: .26rem; color: #FFF;}
	.back:after{display: inline-block;content:"";height: 100%;width: .4rem;background: url(../assets/back_arrow.png) no-repeat; background-size: .1792rem auto;vertical-align: middle; background-position: left center; }
	.header h1{width: 3.2rem;height: 100%;line-height: .768rem;text-align: center;color: #FFF;font-size: .3rem;float: left}
</style>