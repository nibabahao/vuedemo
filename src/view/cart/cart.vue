<template>
	<div class="wrap">
		{{msg}}
    <footer-nav :class="{'isCart':isNowPage}"></footer-nav> 
	</div>
</template>
<script type="text/javascript">
   import FooterNav from '../../components/footer'
   export default {
     name: 'index',
     data () {
       return {
         msg: '购物车',
         isNowPage: true
       }
     },
     components: {
       FooterNav
     }
   }
</script>