$(document).ready(function(){
    var cfrsToken = $('[name="csrf-token"]').attr('content');
    $('.change-quatity').change(function(){
      var id = $(this).parent().find('.cart_product_id').val();
      var quantity = $(this).val();
      $.ajax({
        url: '/carts/update_cart/' + id,
        method: 'PUT',
        data: {quantity: quantity},
        headers: {'X-CFRS-Token': cfrsToken}
      });
    });
  })
