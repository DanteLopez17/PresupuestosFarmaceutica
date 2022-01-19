/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {

  $("#btnRegistrar").click(function () {
    //Validar Nombre (txt)
    var nomb = $("#txtNombre");
    if (nomb.val() == "") {
      alert("Ingrese un Nombre");
      return false;
    }

    
  });
  
  
});