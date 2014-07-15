"use strict";

$(function(){

var value = (function(){
  var approval_prob;
  if ($('#30_approval').data("approval") === "Excellent"){
    approval_prob = 50;
  } else if ($('#30_approval').data("approval") === "Good"){
    approval_prob = 40;
  } else if ($('#30_approval').data("approval") === "Fair"){
    approval_prob = 30;
  } else {
    approval_prob = 20;
  }
  return approval_prob;
})();

var value2 = (function(){
  var approval_prob;
  if ($('#30_approval_2').data("approval") === "Excellent"){
    approval_prob = 50;
  } else if ($('#30_approval_2').data("approval") === "Good"){
    approval_prob = 40;
  } else if ($('#30_approval_2').data("approval") === "Fair"){
    approval_prob = 30;
  } else {
    approval_prob = 20;
  }
  return approval_prob;
})();

var value3 = (function(){
  var approval_prob;
  if ($('#30_approval_3').data("approval") === "Excellent"){
    approval_prob = 50;
  } else if ($('#30_approval_3').data("approval") === "Good"){
    approval_prob = 40;
  } else if ($('#30_approval_3').data("approval") === "Fair"){
    approval_prob = 30;
  } else {
    approval_prob = 20;
  }
  return approval_prob;
})();

$('#30_approval').append("<meter value="+value+" min='0' max='50'></meter>" );
$('#30_approval_2').append("<meter value="+value2+" min='0' max='50'></meter>" );
$('#30_approval_3').append("<meter value="+value3+" min='0' max='50'></meter>" );

});
