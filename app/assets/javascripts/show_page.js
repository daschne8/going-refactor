
let goods = new Object()
window.addEventListener("load",function(){
  let request = $.get('/goods/goods_data', function(data){
    goods = data
    debugger
    $.each(goods,function(index){
      let good = goods[index]
      let good_id = good["id"];
      let good_name = good["name"];
      let occupant_name = good["occupant"]["name"]
      $('.goods-container').append(`<div class='good' id='id-${good_id}'>
        ${good_name} - ${occupant_name}<br>
      </div>`);
    })
  })
})

// form submit code
$(function () {
  $('form').submit(function(event) {
    //prevent form from submitting the default way
    event.preventDefault();
    let values = $(this).serialize();
    console.log(values)
    let posting = $.post('/goods',values);
    posting.done(function(data){
      let good_id = data["id"];
      let good_name = data["name"];
      let occupant_name = data["occupant"]["name"]
      // debugger
      $('.goods-container').append(`<div class='good' id='id-${good_id}'>
        ${good_name} - ${occupant_name}<br>
      </div>`);
    })
  });
});

function addGood(data){
  let good_id = data["id"];
  let good_name = data["name"];
  let occupant_name = data["occupant"]["name"]
  // debugger
  $('.goods-container').append(`<div class='good' id='id-${good_id}'>
    ${good_name} - ${occupant_name}<br>
  </div>`);
}
