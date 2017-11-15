<template>
	<swiper :options='swiperOption' ref='mySwiper' v-if="items.length>0">
		 <swiper-slide v-for="item in items">
		 	<a :href="item.href"><img :src="item.url" :alt="item.title"></a>
		 </swiper-slide>
		 <div class="swiper-pagination"  slot="pagination"></div>	
	</swiper>	
</template>
<script type="text/javascript">
   import { swiper, swiperSlide } from 'vue-awesome-swiper'
   import axios from 'axios'
   export default {
     name: 'carrousel',
     data () {
       return {
         cid: this.$store.state.cid,
         items: [],
         flag: false,
         swiperOption: {
           notNextTick: true,
           autoplay: 3000,
           autoplayDisableOnInteraction: false,
           pagination: '.swiper-pagination',
           autoHeight: true,
           loop: true
         }
       }
     },
     components: {
       swiper,
       swiperSlide
     },
     computed: {
       swiper () {
         return this.$refs.mySwiper.swiper
       }
     },
     mounted () {
       let _this = this
       axios.get('/banner?cid=' + this.cid)
       .then(function (res) {
         if (res.data.msg) {
           _this.items = res.data.list
         }
       })
     }
   }
</script>
<style type="text/css" scoped>
	@import '../../static/css/swiper-3.4.2.min.css'
</style>
<style type="text/css">
	.swiper-container{
    }
	.swiper-pagination{
		width: 100%;
	}
	.swiper-container a{
		display: block;
	}
	.swiper-container img{
		display: block;
		width: 100%;
	}
	.swiper-pagination {
		display: block;
		width: 100%;
	}
</style>
