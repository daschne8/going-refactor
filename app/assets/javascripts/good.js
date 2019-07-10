// let goods_array = []
// class Good{
//   constructor(data){
//     this.id = data["id"];
//     this.name = data["name"];
//     this.description = data["description"];
//     this.occupant = data["occupant"]["name"];
//     // goods_array.push(this)
//   }
//
//   addGood(){
//     let good_id = this.id
//     $('.goods-container').append(`<div class='good' id='good-${this.id}'>
//       <a href="/goods/${this.id}">${this.name} - ${this.occupant}</a>
//       <button class="remove" id="remove-${this.id}">Remove</button><br>
//       <p hidden id='good-${this.id}'>${this.description}</p>
//       <br><br>
//     </div>`);
//     $(`button#remove-${this.id}`).click(function(){
//       let id = parseInt($(this).attr('id').match(/\d+/)[0])
//       removeGood(id)
//     });
//     $(`div#good-${this.id}`).click(function(){
//       $(`div#good-${good_id} p`).toggle()
//     });
//   }
// }


function Good(data){
      this.id = data["id"];
      this.name = data["name"];
      this.description = data["description"];
      this.occupant = data["occupant"]["name"];
}

Good.prototype.addGood = function(){
  let good_id = this.id
  $('.goods-container').append(`<div class='good' id='good-${this.id}'>
    <a href="/goods/${this.id}">${this.name} - ${this.occupant}</a>
    <button class="remove" id="remove-${this.id}">Remove</button><br>
    <p hidden id='good-${this.id}'>${this.description}</p>
    <br><br>
  </div>`);
  $(`button#remove-${this.id}`).click(function(){
    let id = parseInt($(this).attr('id').match(/\d+/)[0])
    removeGood(id)
  });
  $(`div#good-${this.id}`).click(function(){
    $(`div#good-${good_id} p`).toggle()
  });
}
