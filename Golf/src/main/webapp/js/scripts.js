/*!
* Start Bootstrap - Grayscale v7.0.3 (https://startbootstrap.com/theme/grayscale)
* Copyright 2013-2021 Start Bootstrap
* Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-grayscale/blob/master/LICENSE)
*/
//
// Scripts
// 

window.addEventListener('DOMContentLoaded', event => {

    // Collapse responsive navbar when toggler is visible
    const navbarToggler = document.body.querySelector('.navbar-toggler');
    const responsiveNavItems = [].slice.call(
        document.querySelectorAll('#navbarResponsive .nav-link')
    );
    responsiveNavItems.map(function (responsiveNavItem) {
        responsiveNavItem.addEventListener('click', () => {
            if (window.getComputedStyle(navbarToggler).display !== 'none') {
                navbarToggler.click();
            }
        });
    });

});

window.addEventListener('load', () => {
    const forms = document.getElementsByClassName('signup-form');

    Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
            if (form.checkValidity() === false) {
                event.preventDefault();
                event.stopPropagation();
            }
            
            form.classList.add('was-validated');
        }, false);
    });
}, false);

function findAddr(){
	new daum.Postcode({
        oncomplete: function(data) {
        	
        	console.log(data);
        	
            var roadAddr = data.roadAddress;
            var jibunAddr = data.jibunAddress;

            if(roadAddr !== ''){
                document.getElementById("inputAddress").value = roadAddr;
            } 
            else if(jibunAddr !== ''){
                document.getElementById("inputAddress").value = jibunAddr;
            }
        }
    }).open();
}