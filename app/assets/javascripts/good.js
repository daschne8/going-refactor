//let goods_array = []
// class Good{
//   constructor(data){
//     this.id = data["id"];
//     this.name = data["name"];
//     this.description = data["description"];
//     this.occupant = data["occupant"]["name"];
//     // goods_array.push(this)
//   }
//
  // addGood(){
  //   let good_id = this.id
  //   let tags_list = `<ul hidden id='good-${this.id}'>`
  //   $.each(this.tags,function(index,name){
  //     tags_list += `<li>${name}</li>`
  //   })
  //   tags_list += '</ul>'
  //   $('.goods-container').append(`<div class='good' id='good-${this.id}'>
  //     <a href="/goods/${this.id}">${this.name} - ${this.occupant}</a>
  //     <button class="remove" id="remove-${this.id}">Remove</button><br>
  //     <p hidden id='good-${this.id}'>${this.description}</p>
  //     ${tags_list}
  //     <br><br>
  //   </div>`);
  //   $(`button#remove-${this.id}`).click(function(){
  //     let id = parseInt($(this).attr('id').match(/\d+/)[0])
  //     removeGood(id)
  //   });
  //   $(`div#good-${this.id}`).click(function(){
  //     $(`div#good-${good_id} p`).toggle()
  //     $(`div#good-${good_id} ul`).toggle()
  //   });
  // }



function Good(data){
      this.id = data["id"];
      this.name = data["name"];
      this.description = data["description"];
      this.occupant = data["occupant"]["name"];
      this.tags = data["tags"].map(a => a.name)
      //goods_array.push(this)
}

Good.prototype.addGood = function(){
  let good_id = this.id
  let tags_list = `<ul hidden id='good-${this.id}'>`
  $.each(this.tags,function(index,name){
    tags_list += `<li>${name}</li>`
  })
  tags_list += '</ul>'
  $('.goods-container').append(`<div class='good' id='good-${this.id}'>
    <a href="/goods/${this.id}/edit">${this.name} - ${this.occupant}</a>
    <button class="remove" id="remove-${this.id}">Remove</button><br>
    <p hidden id='good-${this.id}'>${this.description}</p>
    ${tags_list}
    <br><br>
  </div>`);
  $(`button#remove-${this.id}`).click(function(){
    let id = parseInt($(this).attr('id').match(/\d+/)[0])
    removeGood(id)
  });
  $(`div#good-${this.id}`).click(function(){
    $(`div#good-${good_id} p`).toggle()
    $(`div#good-${good_id} ul`).toggle()
  });
}
