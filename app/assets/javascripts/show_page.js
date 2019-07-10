
let goods = new Object()
let values

// $(document).on('turbolinks:load',function(){
//   values = ''
//     populateGoods(values)
// })

$(function() {
   $( "#dialog-1" ).dialog({
      autoOpen: false,
      modal: true,
      draggable: false,
      resizeable: false
   });
   $( "#opener" ).click(function() {
      $( "#dialog-1" ).dialog( "open" );
   });
});

$(document).ready(function(){
  values = ''
  populateGoods(values)
})

function populateGoods(values){
  $('div.goods-container').empty()
  let posting = $.post('/goods/goods_data',values)
  posting.done(function(data){
      goods = data
      $.each(goods,function(index){
        let good = new Good(goods[index])
        good.addGood()
      })
      $('form#filter_goods input[type=submit]').removeAttr('disabled', 'disabled')
  })
}
// form submit code
$(function () {
  $('form#add_good').on("submit",function(event) {
    event.preventDefault();
    let values = $(this).serialize();
    let posting = $.post('/goods',values);
    posting.done(function(data){
      let good = new Good(data)
      good.addGood()
    })
    $('form#add_good input[type=submit]').removeAttr('disabled', 'disabled')
    $('form#add_good')[0].reset()
  });
});

$(function(){
  $('form#filter_goods').on("submit",function(event){
    event.preventDefault();
    values = $(this).serialize()
    populateGoods(values)
  })
})

// //removes good from page and deletes from db
function removeGood(id){
  $.ajax({
    type: "delete",
    url: `/goods/${id}`
  })
  $(`#good-${id}`).remove()
  return false
}

// dialog popup
