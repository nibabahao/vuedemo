<template>
	<div class="wrap">
    <s-header></s-header>
    <swiper class="indexSwiper"></swiper>
    <div class="calssify">
       <ul>
         <li class="vip"><router-link :to="{path:'/goods/goodslist',query:{cid: '1'}}"><img src="../../assets/home_banner1.png" alt=""></router-link></li>
         <li><router-link :to="{path:'/goods/goodslist',query:{cid:2}}"><img src="../../assets/home_banner2.png" alt=""></router-link></li>
         <li class="living"><a href="#"><img src="../../assets/home_banner4.png" alt=""></a></li>
         <li class="house"><a href="#"><img src="../../assets/home_banner3.png" alt=""></a></li> 
         <li class="server"><a href="#"><img src="../../assets/home_banner5.png" alt=""></a></li>
       </ul>
    </div>
    <h2>特卖专区</h2>
    <div class="goods">
        <ul>
          <li v-for="item in items">
            <a href="item.href">
              <img :src="item.url" alt="">
              <p>{{item.content}}</p>
            </a>
          </li>
          <infinite-loading @infinite="dataLoading" spinner="bubbles"></infinite-loading>
        </ul>
    </div>
    <footer-nav :class="{'isIndex':isNowPage}"></footer-nav> 
	</div>
</template>
<script type="text/javascript">
   import sHeader from '../../components/sHeader'
   import Swiper from '../../components/swiper'
   import FooterNav from '../../components/footer'
   import InfiniteLoading from 'vue-infinite-loading'
   export default {
     name: 'index',
     data () {
       return {
         msg: '首页',
         items: [
           {href: 'https:www.baidu.com', id: 0, url: 'http://10.161.18.113:3000/assets/2c83aa29-eafe-4146-aae5-1a62c133fda7.jpg', content: '特卖套装：老板油烟机CXW-200-8329+燃气灶JZ(YTR)-9B32...'},
           {href: 'https:www.baidu.com', id: 0, url: 'http://10.161.18.113:3000/assets/2c83aa29-eafe-4146-aae5-1a62c133fda7.jpg', content: '特卖套装：老板油烟机CXW-200-8329+燃气灶JZ(YTR)-9B32...'},
           {href: 'https:www.baidu.com', id: 0, url: 'http://10.161.18.113:3000/assets/2c83aa29-eafe-4146-aae5-1a62c133fda7.jpg', content: '特卖套装：老板油烟机CXW-200-8329+燃气灶JZ(YTR)-9B32...'},
           {href: 'https:www.baidu.com', id: 0, url: 'http://10.161.18.113:3000/assets/2c83aa29-eafe-4146-aae5-1a62c133fda7.jpg', content: '特卖套装：老板油烟机CXW-200-8329+燃气灶JZ(YTR)-9B32...'}
         ],
         isNowPage: true
       }
     },
     components: {
       FooterNav,
       sHeader,
       Swiper,
       InfiniteLoading
     },
     methods: {
       dataLoading ($state) {
         let _this = this
         setTimeout(() => {
           _this.items = _this.items.concat(_this.items)
           $state.loaded()
         }, 1000)
       }
     },
     beforeCreate () {
       this.$store.state.cid = 0
     }
   }
</script>
<style type="text/css" scoped>
   .wrap{padding-bottom: 50px;}
   .indexSwiper{margin-top: .768rem;}
   .calssify{box-sizing: border-box; padding: .16rem .17rem;}
   .calssify ul{width: 100%; overflow: hidden;}
   .calssify ul li{float: left; margin:0 .08rem .05rem 0;}
   .calssify ul li a{display: block;line-height: 1;font-size: 0;}
   .calssify ul li a img{width: 2rem;}
   .calssify ul li.vip a img{width: 1.9rem;}
   .calssify ul li.vip{margin-bottom: 0;}
   .calssify ul li.living,.calssify ul li.server{margin-right: 0;}
   h2{font-size: .24rem;color: #b2a8a5;margin-bottom: .16rem;}
   .calssify ul li.house,.calssify ul li.server{margin-bottom: 0;}
   h2:before,h2:after{display: inline-block;vertical-align: middle;height: 1px;content: ""; width:2.28rem; background: #b2a8a5;}
   h2:before{margin-right: .2248rem;} h2:after{margin-left: .2248rem;}
   .goods{padding: 0 .17rem;}
   .goods li{margin-bottom: .18rem;box-shadow: 0 2px 5px #e3e2e2; background: #FFF;}
   .goods a{display: block;}
   .goods a img{display: block; width: 100%}
   .goods a p{font-size: .21rem;color: #0d0d0d;overflow: hidden;text-overflow:ellipsis;white-space: nowrap;height: .54rem;line-height: .542rem;}
</style>