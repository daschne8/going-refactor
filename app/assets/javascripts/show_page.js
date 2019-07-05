
let goods = new Object()
window.addEventListener("load",function(){
  let request = $.get('/goods/goods_data', function(data){
    goods = data
    $.each(goods,function(index){
      let good = goods[index]
      addGood(good)
    })
  })
})

// form submit code
$(function () {
  $('form#add_good').submit(function(event) {
    //prevent form from submitting the default way
    event.preventDefault();
    let values = $(this).serialize();
    console.log(values)
    let posting = $.post('/goods',values);
    posting.done(function(data){
      addGood(data)
    })
  });
});

function addGood(data){
  let good_id = data["id"];
  let good_name = data["name"];
  let occupant_name = data["occupant"]["name"]
  // debugger
  $('.goods-container').append(`<div class='good' id='good-${good_id}'>
    <a href="/goods/${good_id}">${good_name} - ${occupant_name}</a>

    <br>
  </div>`);
}

function removeGood(id){
  $.ajax({
    type: "delete",
    url: `/goods/${id}`
  })
  $(`#good-${id}`).remove()
  return false
}
