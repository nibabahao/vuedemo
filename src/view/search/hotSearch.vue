<template>
   <div class="hotRoot">
      <h2>热门搜索</h2>
      <ul>
      	<li v-for="hot in hots"><a href="">{{hot}}</a></li>
      </ul>
   </div>
</template>
<script type="text/javascript">
   export default {
     data () {
       return {
         isNowPage: true,
         hots: ['小挎包', '秋冬女装', 'iphone6', '充电宝', '三星A9', '电视机', '休闲美食']
       }
     }
   }
</script>
<style type="text/css" scoped>
	.hotRoot h2{margin: .3rem auto;line-height: 1; font-size: .256rem;color: #8e8e8e;}
	.hotRoot ul {width: 6.05rem; margin:0 auto; overflow: hidden;}
	.hotRoot ul li {float: left;}
	.hotRoot ul li a {display: block;font-size: .256rem;color: #8e8e8e;padding: .085rem .2rem;border-radius: 30px;border: 1px solid #d9d9d9;background: #FFF;margin:0 .2rem .2rem 0;}
</style>