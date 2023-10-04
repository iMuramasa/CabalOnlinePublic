$(document).ready(function(){
  $(".carousel").owlCarousel({
  	loop:true, //карусель будет бесконечной
    margin:10,
    nav:true, //стрелки навигации
    center: true, //элементы карусели будут выравниваться по центру
    navText: [
	    "<", //иконки взяты отсюда: https://fontawesome.com/v4/icon/angle-left
	    ">"
	], // иконки стрелочки
    responsive:{ //адаптив. Сколько будет отображаться карточек в зависимости от ширины экрана (items) в пикселях
        0:{
            items:1
        },
        600:{
            items:3
        },
        1000:{
            items:5
        }
        
    }
  });
});