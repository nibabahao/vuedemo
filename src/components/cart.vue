<template>
   <div class="cart">
		<i><em>1</em></i>
		<a href="javascript:void(0)" class="buy" @click="buy">立即购买</a>
		<a href="javascript:void(0)" class="addcart">加入购物车</a>
		<div class="mask" :class="{active:showBuy === true}" @click="close"> 
			<div class="pannel" @click.stop>
				<div class="box clearfix">
					<img src="http://10.161.18.113:3000/assets/tea.jpg">
					<dl>
						<dt>态合堂 野生石斛花野生红滇红茶400g 野生石斛花银针滇红茶300g</dt>
						<dd>
							<span>&yen;&nbsp;11.5</span>
							<em>原价: <s>&yen;&nbsp;12.8</s></em>
						</dd>
					</dl>
				</div>
				<div class="type">
					<p>规格</p>
					<ul>
						<li class="active">300g</li>
						<li>600g</li>
					</ul>
				</div>
				<div class="qulity">
					<p>数量</p>
					<ul>
						<li>-</li>
						<li class="count">1</li>
						<li>+</li>
					</ul>
				</div>		
				<button>确认</button>		
				<i class="close" @click.stop="close"></i>
			</div>
		</div>		
   </div>
</template>
<script type="text/javascript">
   export default {
     name: 'cart',
     data () {
       return {
         showBuy: false
       }
     },
     methods: {
       buy () { this.showBuy = true },
       close () { this.showBuy = false }
     }
   }
</script>
<style type="text/css" scoped>
	.cart{
		position: fixed;
		bottom: 0;
		left: 50%;
		margin-left: -3.2rem;
		width: 100%;
		height: 50px;
		border-top: 1px solid #e0e0e0;
		max-width: 6.4rem;
		background-color:#f2f2f2;
		z-index: 4;
	}
	.cart>i{
		position: relative;
		float: left;
		width: 29px;
		height: 28px;
		margin:11px 0 11px .17rem;
		background:url(../assets/icon.png) no-repeat;
		background-size: 216px auto;
		background-position: 0 -197px;
	}
	.cart>i em {
		position: absolute;
		width: 14px;
		height: 14px;
		text-align: center;
		line-height: 14px;
		background-color: #ee3749;
		border-radius: 50%;
		color:#FFF;
		right: -7px;
		top:0;
	}
	.cart>a {
		float:right;
		height: 32.5px;
		width: 107.5px;
		color:#FFF;
		text-align: center;
		line-height: 32.5px;
		margin-top: 8.75px;
		border-radius: 5px;
	}
	.cart .addcart{
		background-color: #ed9d2a;
		margin-right: .426rem;
	}
	.cart .buy{
		background-color: #ee3749;
		margin-right: .17rem;
	}
	.mask{position: fixed; top:0; left: 0; background-color: rgba(0,0,0,0.5); width: 100%;height: 100%; transition: all .3s; -webkit-transition: all .2s; transform: translate3d(0,100%,0); -webkit-transform: translate3d(0,100%,0);}
	div.mask.active{transform: translate3d(0,0,0); -webkit-transform: translate3d(0,0,0)}
	.mask .pannel{position: absolute; bottom: 0;left: 0; width: 100%; height: 5.42rem; background-color: #FFF;padding: .17rem;box-sizing: border-box;  transform: translate3d(0,100%,0); -webkit-transform: translate3d(0,100%,0);transition: all .5s; -webkit-transition: all .4s; }
	div.mask.active .pannel{transform: translate3d(0,0,0); -webkit-transform: translate3d(0,0,0)}
	.mask .box img {width: 1.536rem;height: 1.536rem;float: left; }
	.mask .box dl {margin-left:.17rem; float: left; width: 4.053rem;}
	.mask .box dt {font-size: .256rem; color: #141414; line-height: 1.4;-webkit-line-clamp: 2;text-overflow: ellipsis;display: -webkit-box;-webkit-box-orient: vertical; height: .68rem; overflow: hidden;}	
	.mask .box dd {margin-top: .3584rem;line-height: 1.4; overflow: hidden;}
	.mask .box dd span {float: left; font-size: .273rem; color:#ff3f12;margin-right: .44rem;}
	.mask .box dd em {float: left; color:#666666; font-size: .2218rem;margin-top: .04rem;}	
	.mask .type,.qulity{margin-top: .3rem;font-size: .256rem; line-height: 1;}
	.mask .type ul,.qulity ul{width: 100%;overflow: hidden;margin-top: .17rem;}
	.mask .type ul li{float: left; width: 1.05rem;height: .44rem;line-height: .44rem;text-align: center;border:1px solid #dbdbdb;margin-right: .24rem; color: #959595;}
	.mask .type ul li.active{ color:#FFF; background-color: #f19005; border:1px solid #f19005; }
	.qulity li{float: left; height: .44rem;line-height: .44rem;text-align: center;border:1px solid #dbdbdb;margin-right: .24rem; color: #959595; width: .44rem;}
	.qulity li.count{width: .6rem;}
	.pannel button{display: block; width: 2.15rem; height: .59rem;margin:0 auto; padding: 0;margin-top: .46rem; background-color: #f19005;color: #FFF; border:none; border-radius: 3px;}
	i.close{position: absolute; right: .17rem; top:.17rem; width: .3rem; height: .3rem; background: url(../assets/close.png) no-repeat; background-size: 100% auto;}
</style>