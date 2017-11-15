<template>
	<div class="wrap">
    <headers :title="title"></headers>
    <swiper class="indexSwiper"></swiper>
    <div class="content">
      <aside>
        <div :style="slide"></div>
        <ul>
          <li v-for='(item, index) in items' @click="sliding($event,index,item.id)" data-flag=1>{{item.name}}</li>
        </ul>
      </aside>
      <div class="menu" v-if="cid == 1">
        <ul>
          <li v-for="list in lists">
            <router-link :to="{path: '/pdetail', query:{code: list.pid+''+list.id}}">
              <img :src="list.url">
              <dl>
                <dt>{{list.title}}<span>{{list.distance}}km</span></dt>
                <dd>{{list.content}}</dd>
              </dl>
            </router-link>
          </li>
        </ul>
      </div>
      <div class="menu food" v-else>
        <ul>
          <li v-for="list in lists">
            <router-link :to="{path:'/fdetail',query:{code:list.pid+''+list.id}}">
              <img :src="list.url">
              <dl>
                <dt>{{list.title}}</dt>
                <dd><span>&yen;{{list.dprice}}</span>原价：<s>&yen;{{list.oprice}}</s></dd>
              </dl>
            </router-link>
          </li>
        </ul>
      </div>      
    </div>
    <footer-nav :class="{'isIndex':isNowPage}"></footer-nav> 
	</div>
</template>
<script type="text/javascript">
   import Headers from '../../components/header'
   import Swiper from '../../components/swiper'
   import footerNav from '../../components/footer'
   import axios from 'axios'
   export default {
     name: 'index',
     data () {
       return {
         title: '商家信息',
         cid: this.$store.state.cid,
         items: [],
         clists: [],
         lists: [],
         slide: {
           transform: 'translate3d(0,0,0)',
           webkitTransform: 'translate3d(0,0,0)'
         },
         isNowPage: true
       }
     },
     components: {
       Swiper,
       Headers,
       footerNav
     },
     methods: {
       sliding (e, index, id) {
         let flag = e.target.dataset.flag - 0
         this.slide.transform = 'translate3d(0,' + index * 100 + '%,0)'
         this.slide.webkitTransform = 'translate3d(0,' + index * 100 + '%,0)'
         if (flag !== 0) {
           let _this = this
           axios.get('/menu?id=' + id)
           .then(function (res) {
             if (res.data.msg) {
               _this.lists = res.data.list
               _this.clists[index] = res.data.list
               e.target.dataset.flag = 0
             }
           })
         } else {
           this.lists = this.clists[index]
         }
       }
     },
     beforeCreate () {
       this.$store.state.cid = this.$route.query.cid
     },
     mounted () {
       let _this = this
       axios.get('/nav?cid=' + _this.cid)
       .then((res) => {
         if (res.data.msg) {
           _this.items = res.data.list
         }
       })
       .then(() => {
         axios.get('/menu?id=' + _this.items[0].id)
          .then(function (res) {
            if (res.data.msg) {
              _this.lists = res.data.list
            }
          })
       })
     }
   }
</script>
<style type="text/css" scoped>
  .indexSwiper{margin-top: .768rem;}
  .content{position:fixed;padding: 3.328rem 0 50px;left:50%;width:6.4rem;margin-left:-3.2rem;top:0;overflow: hidden;height: 100%;box-sizing: border-box;}
  .content aside{position: relative; background: #f2f2f2;height: 100%;float: left;width: 1.792rem;overflow-y: scroll;}
  .content aside li{font-size: .256rem;height: .853rem; text-align: center;line-height: .853rem;}
  .content aside div { position: absolute; top:0; left: 0; width: 100%;box-sizing: border-box;height: .853rem;background-color: rgba(100,100,100,.1); border-left: .1024rem solid #f29004; transition: transform .5s linear; -webkit-transition: transform .2s linear;}
  .content .menu{width: 4.608rem;float: left;height: 100%;overflow-y: scroll;height: 100%;background: #FFF;}
  .content .menu li{height: 1.28rem;padding: .1878rem 0; margin:0 .1878rem;border-bottom: 1px solid #d9d5d5;}
  .content .menu li a{display: block;height: 100%;overflow: hidden;}
  .content .menu li a img {width: 1.28rem;height: 1.28rem;float: left;}
  .content .menu li a dl {width: 2.8rem;float: left;box-sizing: border-box;padding-left: .1878rem;  text-align: left;}
  .content .menu li a dt {position:relative;font-size: .2218rem;color: #1b1b1b;line-height: 1.2;-webkit-line-clamp: 2;text-overflow: ellipsis;display: -webkit-box;-webkit-box-orient: vertical;}
  .content .menu li a dd {font-size: .2rem;color: #a6a4a4;overflow: hidden;line-height: 1.2;margin-top: .26768rem;-webkit-line-clamp: 2;text-overflow: ellipsis;display: -webkit-box;-webkit-box-orient: vertical;}
  .content .menu li a dt span{position: absolute; right: 0;bottom: -.26768rem;font-size: .22306rem; color: red;}
  .content .food li a dd {font-style: italic; width: 100%; font-size: .16rem;}
  .content .food li a dd span{font-style: normal; color: red;margin-right: .15rem;}
  .content .food li a dt {overflow: hidden;}
</style>