<template>
	<div class="wrap">
    <swiper></swiper>
    <div class="content">
      <ul class="clearfix">
        <li v-for="(item,index) in items">
          <a :href="index">
            <img :src="item.url">
            <dl>
              <dt>{{item.title}}</dt>
              <dd><span>&yen;{{item.dprice}}</span>原价：<s>&yen;{{item.oprice}}</s></dd>
            </dl>
          </a>
        </li>                       
      </ul>
    </div>
    <footer-nav :class="{'isVip':isNowPage}"></footer-nav> 
	</div>
</template>
<script type="text/javascript">
   import FooterNav from '../../components/footer'
   import Swiper from '../../components/swiper'
   export default {
     name: 'vip',
     data () {
       return {
         items: [
           {id: 0, url: 'http://10.161.18.113:3000/assets/ec87eca8-c1bd-411b-b7dc-979a50354303.jpg', title: '爽脆番石榴   3斤/装，7斤...', oprice: '10.00', dprice: '18.00'},
           {id: 1, url: 'http://10.161.18.113:3000/assets/d6a543e4-cd47-41f6-a812-274da55d0cd5.jpg', title: '凤爪小妹 酱香招牌鸡爪 柠檬鸭...', oprice: '62.00', dprice: '118.00'},
           {id: 2, url: 'http://10.161.18.113:3000/assets/fc3efc2b-4ee6-4470-972b-665f0bbaa6f0.jpg', title: '巧师傅月饼 HelloKitt...', oprice: '88.00', dprice: '128.00'},
           {id: 3, url: 'http://10.161.18.113:3000/assets/9bf83bc2-06fd-4eaa-a346-efd117c5e812.jpg', title: '加厚床裙式磨毛四件套  1.8...', oprice: '118.00', dprice: '168.00'}
         ],
         isNowPage: true
       }
     },
     components: {
       FooterNav,
       Swiper
     },
     beforeCreate () {
       this.$store.state.cid = 5
     }
   }
</script>
<style type="text/css" scoped>
  .wrap{padding-bottom: 50px;}
  .content ul{padding: .2rem .2rem .095rem;}
  .content li{width: 2.9475rem;float: left; overflow: hidden; background: #FFF;margin-bottom: .105rem;}
  .content li:nth-child(odd){margin-right: .105rem;}
  .content a {display: block;}
  .content a img{display:block;width: 100%; height: 2.9475rem;}
  .content dl{padding: 0 .1546rem .1546rem;}
  .content dt {line-height: 1;margin-top: .2218rem; font-size: .2218rem; color:#292929;overflow: hidden;text-overflow: ellipsis; white-space: nowrap; text-align: left;}
  .content dd{line-height: 1; margin-top: .239rem;text-align: left; font-size:.226rem;}
  .content dd span{font-size: .273rem;color:#ff0000; font-weight: bolder;margin-right: .1236rem;}
</style>