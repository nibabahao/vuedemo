<template>
	<div class="pwrap">
      <div class="picbox">
        <div class="headPic">
          <div class="imgbox">
            <div>
                <img :src="item.pic">
            </div>
            <i class="type1"></i>
          </div>
          <h2>{{item.name}}</h2>
          <p>VIP会员</p>
        </div>
      </div>
      <ul class="list1">
        <li class="base"><router-link :to='{path:"/base",query:{item: item}}'>基本资料</router-link></li>
        <li class="order"><a href="javascript:void(0)">我的订单</a></li>
        <li class="save"><a href="javascript:void(0)">我的收藏</a></li>
        <li class="wallet"><a href="javascript:void(0)">我的钱包</a></li>
        <li class="address"><a href="javascript:void(0)">收货地址</a></li>
        <li class="Vip"><a href="javascript:void(0)">升级会员</a></li>
      </ul>
      <ul class="list2">
        <li class="more"><a href="javascript:void(0)">更多</a></li>
        <li class="logout" @click="logout"><a href="javascript:void(0)">注销</a></li>
      </ul>      
      <footer-nav :class="{'isMine':isNowPage}"></footer-nav>
	</div>
</template>
<script type="text/javascript">
   import FooterNav from '../../components/footer'
   import axios from 'axios'
   export default {
     name: 'mine',
     data () {
       return {
         msg: '我的',
         item: {},
         isNowPage: true
       }
     },
     methods: {
       logout () {
         let _this = this
         axios.get('/logout').then(res => {
           if (res.data.status) {
             alert('已退出登陆')
             _this.$router.push({path: '/login'})
           } else {
             alert('登出失败稍后再试')
           }
         })
       }
     },
     components: {
       FooterNav
     },
     mounted () {
       let _this = this
       axios.get('/getInfo').then(res => {
         if (res.data.status) {
           _this.item = res.data.list[0]
         } else {
           alert('数据出错')
         }
       })
     }
   }
</script>
<style type="text/css" scoped>
  .pwrap{ padding-bottom: 50px;}
  .picbox{position: relative;width: 6.4rem;height: 3.82rem; background-image: url(../../assets/myInfo_bg.png); background-size: 100% auto;}
  .headPic{position: absolute; width: 6.4rem; height: 2.37rem; top:50%; left: 50%; margin-left: -3.2rem; margin-top:-1.185rem; }
  .imgbox{position:relative;width: 1.28rem; margin:0 auto; height: 1.28rem; border: 2px solid #FFF; border-radius: 50%; box-sizing: border-box;}
  .imgbox div{ overflow: hidden; width: 100%; height: 100%; border-radius: 50%;}
  .imgbox img {height: 100%;}
  .imgbox i.type1{background: url(../../assets/vipcharge.png) no-repeat; background-size: 100% 100%; width: .4069rem; height: .3242rem;position: absolute; right: .01rem; bottom: -.08rem;}
  .headPic h2{font-size: .2731rem; color: #FFF; line-height: 1; margin-top: .1877rem; text-align: center;}
  .headPic p{margin:.1877rem auto 0; color:#FFF; width: 1.152rem; height: .35rem; line-height: .35rem; text-align: center;box-sizing: border-box; border-radius: 10px; border:1px solid #FFF; background-color: rgba(255,255,255,.5);}
  .list1,.list2{ margin-top: .1536rem;background: #FFF;padding-left: .3rem;}
  .pwrap li{ height: .785rem; text-align: left; border-bottom: 1px solid #dbdbdb; line-height: .785rem; font-size: .256rem; color: #1a1a1a;box-sizing: border-box;}
  .pwrap a{display: block; height: 100%;box-sizing: border-box; padding-left: .725rem; position: relative;}
  .pwrap a:before{ display: block; width: .34rem; height: .34rem; content: ""; position: absolute; top:.225rem;left: 0;background-image: url(../../assets/list_icon_all.png); background-size: 100% auto; background-repeat: no-repeat;}
  .pwrap a:after{ display: block; width: .1024rem; height: 100%;top:0; content: ""; position: absolute; right: .256rem;background-image: url(../../assets/list_arrow.png); background-size: 100% auto; background-repeat: no-repeat;background-position: center;}
  .base a:before{background-position: center 0;}
  .order a:before{background-position: center -.34rem;}
  .save a:before{background-position: center -.68rem;}
  .wallet a:before{background-position: center -1.02rem;}
  .address a:before{background-position: center -1.36rem;}
  .Vip a:before{background-position: center -1.7rem;}
  .more a:before{background-position: center -2.04rem;}
  .logout a:before{background-position: center -2.38rem;}
  .pwrap .logout{border-bottom: none;}
</style>