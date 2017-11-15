<template>
   <div class="footer">
		<ul class="clearfix">
			<li>
				<router-link :to='{path:"/index",query:{cid: "0"}}' class="home">首页</router-link>
			</li>
			<li>
				<router-link to='/vip' class="vip">会员杂锦</router-link>
			</li>
			<li>
				<router-link to='/catagory' class="catagory">分类</router-link>
			</li>
			<li>
				<router-link to='/cart' class="cart">购物车</router-link>
			</li>
			<li>
				<router-link to='/mine' class="mine">我的</router-link>
			</li>
		</ul>
   </div>
</template>
<style type="text/css" scoped>
	.footer{
		position: fixed;
		bottom: 0;
		left: 50%;
		margin-left: -3.2rem;
		width: 100%;
		height: 50px;
		border-top: 1px solid #e0e0e0;
		background: #FFF;
		max-width: 6.4rem;
	}
	.footer ul{
		height: 50px;
	}
	.footer li{
		float: left;
		width: 20%;
		height: 100%;
		text-align: center;
	}
	.footer li a{
		display: block;
		height: 100%;
	}
	.footer li a:before{
		display: block;
		content: "";
		width: 24px;
		height: 24px;
		margin:5px auto 0;
		background-image: url(../assets/icon.png);
		background-size: 216px 226px;
	}
	.footer li .home:before{
		background-position: -72px -102px;
	}
	div.isIndex li .home:before{
		background-position: -72px -78px;
	}	
	.footer li .vip:before{
		background-position: -48px -102px;
	}
	div.isVip li .vip:before{
		background-position: -48px -78px;
	}	
	.footer li .catagory:before{
		background-position: -24px -102px;
	}
	div.isCatagory li .catagory:before{
		background-position: -24px -78px;
	}		
	.footer li .cart:before{
		background-position: -96px -102px;
	}
	div.isCart li .cart:before{
		background-position: -96px -78px;
	}			
	.footer li .mine:before{
		background-position: 0 -102px;
	}
	div.isMine li .mine:before{
		background-position: 0 -78px;
	}
	div.isIndex .home,div.isVip .vip,div.isCatagory .catagory,div.isCart .cart,div.isMine .mine{color: #f39612}
</style>