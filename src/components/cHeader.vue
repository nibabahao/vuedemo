<template>
	<div class="header">
    <ul>
      <li @click="showNav">
        全部
        <div class="list" v-show="show" @click.stop>
          <a href="#" class="active">糖果巧克力</a>
          <a href="#">糖果巧克力</a>
          <a href="#">糖果巧克力</a>
          <a href="#">糖果巧克力</a>
          <a href="#">糖果巧克力</a>
        </div>
      </li>
      <li class="mid">价格</li>
      <li class="price">销量优先</li>
    </ul>
	</div>
</template>
<script type="text/javascript">
   export default {
     data () {
       return {
         show: false
       }
     },
     methods: {
       showNav () {
         this.show = !this.show
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
	.header{position: fixed;top:0;left: 0;width: 100%;height: .768rem;background: #FFF; z-index:2;left:50%;max-width:6.4rem;margin-left:-3.2rem;border-bottom: 1px solid #e0e0e0; box-sizing: border-box;}
  .header ul{width: 6.4rem; height: 100%}
  .header li{float: left; width: 2.1rem; height: 100%; line-height: .768rem; font-size: .2473rem; color:#666;}
  .header li:first-child{color:#f39612; position: relative;}
  .header li.mid{width: 2.2rem;}
  .header .mid:after,.header .price:after{display: inline-block; margin-left:4px;vertical-align: 5px; content: ""; content: ""; width: 0; height: 0; border:5px solid transparent; border-bottom-color: #999999;}
  .header li.low:after{ border-bottom-color: transparent; border-top-color: #999; vertical-align: -5px;}
  .header .list{background: #FFF; border-bottom: 1px solid #e0e0e0; padding: 8px .256rem; overflow: hidden; position: absolute; top:.768rem; left: 0; width: 6.4rem; box-sizing: border-box;}
  .header .list a{float: left;padding: 8px; font-size: .16rem; line-height: 1; margin:0 0 10px .4rem ; background: #f2f2f2; border-radius: 10px;}
  .header .list a.active{color:#FFF; background: #f39612;}
</style>