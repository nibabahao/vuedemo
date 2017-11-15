<template>
	<div class="header" :class="{active:isTop === 0}">
    <a href="javascript:void(0)" class="back" @click="back"></a>
		<h1></h1>
    <a href="javascript:void(0)" class="btngroup">
      <i></i>
      <em @click="share"></em>
    </a>
    <div class="mask"></div>
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
         this.$router.go(-1)
       },
       scrollHandle () {
         let scroll = document.documentElement.scrolltop || document.body.scrollTop
         this.isTop = scroll > 100 ? 0 : 1
       },
       share () {
         this.$store.state.shareShow = true
       }
     },
     mounted () {
       window.addEventListener('scroll', this.scrollHandle)
     }
   }
</script>
<style type="text/css" scoped>
	.header{position: fixed;top:0;left: 0;width: 100%;height: .768rem; z-index:2;max-width: 6.4rem;left: 50%;margin-left: -3.2rem; transform: scale3d(.95,.95,.95);-webkit-transform: scale3d(.95,.95,.95); transition: all .5s; background-color:transparent;}
	.back{float: left;width: 1.6rem;text-align: left;height: 100%;line-height: .768rem;box-sizing: border-box;padding-left: .18rem;font-size: .26rem; color: #FFF;}
	.back:after{display: inline-block;content:"";height: 100%;width: .4rem;background: url(../assets/back_arrow.png) no-repeat; background-size: .1792rem auto;vertical-align: middle; background-position: left center; }
  .btngroup{float: left;width: 2.1rem;text-align: right;padding-right: .18rem;box-sizing: border-box;height: .768rem; display: flex; flex-direction: row; align-items: center; justify-content: flex-end;}
  .btngroup i{display:inline-block; width: 25px; height: 24px; vertical-align: middle; background: url(../assets/icon.png) no-repeat;background-size: 216px auto; background-position: -32px -200px; margin-right: .5rem;}
  .btngroup em{display:inline-block; width: 25px; height: 20px; vertical-align: middle; background: url(../assets/icon.png) no-repeat;background-size: 216px auto; background-position: -66px -202px;}
	.header h1{width: 2.7rem;height: 100%;line-height: .768rem;text-align: center;color: #FFF;font-size: .3rem;float: left}
  .fHeader .header{border-bottom:10px solid red;}
  div.active{ background-color: #f29004; transform: scale3d(1,1,1); -webkit-transform: scale3d(1,1,1)}
</style>