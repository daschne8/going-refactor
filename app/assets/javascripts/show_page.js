
let goods = new Object()
let values

$(document).on('turbolinks:load',function(){
  values = ''
    populateGoods(values)
})

function populateGoods(values){
  $('div.goods-container').empty()
  let posting = $.post('/goods/goods_data',values)
  posting.done(function(data){
      goods = data
      $.each(goods,function(index){
        let good = goods[index]
        addGood(good)
        $('form#filter_goods input[type=submit]').removeAttr('disabled', 'disabled')
      })
  })
}
// form submit code
$(function () {
  $('form#add_good').on("submit",function(event) {
    event.preventDefault();
    let values = $(this).serialize();
    let posting = $.post('/goods',values);
    posting.done(function(data){
      addGood(data)
      $('form#add_good input[type=submit]').removeAttr('disabled', 'disabled')
      $('form#add_good')[0].reset()
    })
  });
});

$(function(){
  $('form#filter_goods').on("submit",function(event){
    event.preventDefault();
    values = $(this).serialize()
    populateGoods(values)
  })
})

//adds the goods to container and attaches removal event listener
function addGood(data){
  let good_id = data["id"];
  let good_name = data["name"];
  let occupant_name = data["occupant"]["name"]
  let good_desc = data["description"]
  $('.goods-container').append(`<div class='good' id='good-${good_id}'>
    <a href="/goods/${good_id}">${good_name} - ${occupant_name}</a>
    <a class="remove" id="remove-${good_id}">Remove</a><br>
    <p hidden id='good-${good_id}'>${good_desc}</p>
    <br><br>
  </div>`);
  $(`div#good-${good_id}.good`).click(function(){
    $(`div#good-${good_id}.good p`).toggle()
  })
  $(`a#remove-${good_id}`).click(function(){
    let id = parseInt($(this).attr('id').match(/\d+/)[0])
    removeGood(id)
  })
}

//removes good from page and deletes from db
function removeGood(id){
  $.ajax({
    type: "delete",
    url: `/goods/${id}`
  })
  $(`#good-${id}`).remove()
  return false
}
