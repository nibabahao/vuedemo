<template>
	<div class="header">
    <router-link to='/address' class="area">{{area}}</router-link>
		<h1>生活一家</h1>
		<router-link to='/search/hotSearch' class="search"></router-link>
	</div>
</template>
<script type="text/javascript">
   export default {
     data () {
       return {

       }
     },
     computed: {
       area () {
         let location = '广州'
         return location
       }
     }
   }
</script>
<style type="text/css" scoped>
	.header{position: fixed;top:0;left: 0;width: 100%;height: .768rem;background: #f29004; z-index:2;left:50%;max-width:6.4rem;margin-left:-3.2rem;}
	.area{float: left;width: 1.6rem;text-align: left;height: 100%;line-height: .768rem;box-sizing: border-box;padding-left: .18rem;font-size: .26rem; color: #FFF;}
	.area:after{display: inline-block;content:"";height: 100%;width: .4rem;background: url(../assets/icon1.png) no-repeat; background-size: 200% auto;vertical-align: middle; background-position: right center; }
	.header h1{width: 3.2rem;height: 100%;line-height: .768rem;text-align: center;color: #FFF;font-size: .3rem;float: left}
	.search{float: left;width: 1.6rem;text-align: right;padding-right: .18rem;box-sizing: border-box;height: .768rem;}
	.search:after{display: inline-block;content:"";height: 100%;width: .4rem;background: url(../assets/icon1.png) no-repeat; background-size: 200% auto;vertical-align: middle; background-position: left center;}
</style>