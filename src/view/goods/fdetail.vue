<template>
	<div class="detailWrap">
		<fheader></fheader>
		<div class="imgBox">
			<img :src="item.url">
			<dl>
				<dt>{{item.title}}</dt>
				<dd>
					<p class="clearfix">
						<span>&yen; {{item.dprice}}</span>
						<em>原价: <s>&yen; {{item.oprice}}</s></em>
						<i>销量：{{item.salevolume}}</i>
					</p>
				</dd>
				<dd class="clearfix">
					<em>限时: {{time}}</em>
					<i>限量：{{item.quantity}}件</i>
				</dd>
			</dl>
		</div>
		<div class="content">
			<ul class="nav">
				<li :class="{active: tabIndex === 0}" @click="tab(0)">商品详情</li>
				<li :class="{active: tabIndex === 1}" @click="tab(1)">用户评价</li>
			</ul>
			<div class="detial" v-if="tabIndex === 0">
				{{item.content}}
			</div>
			<div class="evaluate" v-else>
				<ul>
					<li v-for="list in lists">
						<p class="clearfix">
							<em>{{list.nickname}}</em>
							<span>
								<a href="#" :class="{active:list.grade>=1}"></a>
								<a href="#" :class="{active:list.grade>=2}"></a>
								<a href="#" :class="{active:list.grade>=3}"></a>
								<a href="#" :class="{active:list.grade>=4}"></a>
								<a href="#" :class="{active:list.grade>=5}"></a>
							</span>
							<time>{{list.time}}</time>
						</p>
						<p>{{list.content}}</p>
					</li>				
				</ul>
			</div>
		</div>
		<share></share>
		<cart></cart>
	</div>
</template>
<script type="text/javascript">
   import axios from 'axios'
   import Fheader from '../../components/fheader'
   import Cart from '../../components/cart'
   import Share from '../../components/share'
   export default {
     name: 'detail',
     data () {
       return {
         item: {},
         lists: [],
         tabIndex: 0,
         cid: this.$store.state.cid,
         time: 'XX天XX时XX分XX秒'
       }
     },
     components: {
       Fheader,
       Cart,
       Share
     },
     methods: {
       tab: function (id) {
         this.tabIndex = id
       }
     },
     mounted () {
       let code = this.$route.query.code
       let _this = this
       axios.get('/fdetail?code=' + code)
       .then((res) => {
         if (res.data.msg) {
           _this.item = res.data.list[0]
         }
       })
       .then(() => {
         setInterval(() => {
           const times = new Date(this.item.deadline).getTime() - new Date().getTime()
           const day = parseInt(times / 1000 / 60 / 60 / 24)
           const hour = parseInt(times / 1000 / 60 / 60 % 24)
           const minute = parseInt(times / 1000 / 60 % 60)
           const second = parseInt(times / 1000 % 60)
           this.time = day + '天' + hour + '时' + minute + '分' + second + '秒'
         }, 1000)
       })
       axios.get('/evaluate?code=' + code)
       .then((res) => {
         if (res.data.msg) {
           _this.lists = res.data.list
         }
       })
     },
     beforeDestroy () {
       console.log('结束前')
     },
     destroyed () {
       console.log('结束后')
     }
   }
</script>
<style type="text/css" scoped>
	.detailWrap{text-align: left;}
	.detailWrap .imgBox {background-color:#FFF;}
	.detailWrap .imgBox img{width: 100%;display: block;}
	.detailWrap .imgBox dl {margin:0;padding: .18rem .2048rem;border-bottom: 1px solid #ddd;}
	.detailWrap .imgBox dt {font-size: .256rem; color: #141414; line-height: 1.4;}
	.detailWrap .imgBox dd {color: #595959; line-height: 1.4; margin-top: .15rem;}
	.detailWrap .imgBox dd span {float: left; font-size: .273rem; color:#ff3f12;margin-right: .44rem;}
	.detailWrap .imgBox dd em {float: left; color:#666666; font-size: .2218rem;margin-top: .026rem;}
    .detailWrap .imgBox dd i {float: right; color:#666666; font-size: .2218rem;}
    .detailWrap .imgBox p {padding-bottom: .2rem;border-bottom:1px solid #d9d9d9;}
    .detailWrap .imgBox dd:last-child {margin:.2286rem 0 .1048rem;}
    .detailWrap .content {background: #FFF;margin-top: .213rem;}
    .detailWrap .content .nav{ width: 100%; overflow: hidden; }
    .detailWrap .content .nav li {position:relative; float:left; width: 50%; text-align: center;font-size: .256rem;color:#595959;height: .8rem; line-height: .8rem;border-bottom:1px solid #d9d9d9;}
    .detailWrap .content .nav li:after {position: absolute; content:""; left:50%; margin-left: -.4949rem;bottom:-.0213rem; height: .0426rem; width: .9898rem; transition: all .5s; -webkit-transition:all .4s; transform: scale3d(0,1,1); -webkit-transform: scale3d(0,1,1); background: #ff3b0e;}
    .detailWrap .content .nav li.active:after { transform: scale3d(1,1,1); -webkit-transform: scale3d(1,1,1);}  
	.detailWrap .content .detial {background: #FFF;margin-top:.213rem; padding: .2048rem;}
	.detailWrap .evaluate li {padding: .2048rem;border-bottom:1px solid #d9d9d9;}
	.detailWrap .evaluate em {color: #010101; font-size: .2218rem; float: left;margin-right: .17rem;}
	.detailWrap .evaluate time {color: #666666; font-size: .2218rem; float: right;}
	.detailWrap .evaluate span {float: left; height: 11.25px;}
	.detailWrap .evaluate span a{width: 11.25px; height: 11.25px; vertical-align: middle; display: inline-block;background: url(../../assets/icon.png) no-repeat; background-size:172.8px auto;background-position: -55px -104px;}
	.detailWrap .evaluate span a.active{background-position: -73px -104px;}
	.detailWrap .evaluate p:last-child {font-size: .256rem; color:#000; margin-top: .1536rem;}
</style>