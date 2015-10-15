/**
 * 
 */


	
	function toggle_visibility(id) {
	       var e = document.getElementById(id);
	       if(e.style.display == 'block')
	          e.style.display = 'none';
	       else
	          e.style.display = 'block';
	    };
	    
	 function mostrarMapa(){
		 document.getElementById('mapBox').style.width= "1120px";
		 document.getElementById('mapBox').style.height= "650px";
		 document.getElementById('mapBox').style.marginTop= "50px";
		 document.getElementById('mapBox').style.marginLeft= "0px";
		 google.maps.event.trigger(map, "resize");
		 document.getElementById('btnG').innerHTML = "<input type='button' class ='btn btn-block btn-lg btn-info' onclick='mapaC();' value='Reducir'>";
		 window.location.hash ="mapBox";
	 }
	 
	 function mapaC(){
		 document.getElementById('mapBox').style.width= "650px";
		 document.getElementById('mapBox').style.height= "360px";
		 document.getElementById('mapBox').style.marginTop= "0px";
		 document.getElementById('mapBox').style.marginLeft= "40px";
		 google.maps.event.trigger(map, "resize");
		 document.getElementById('btnG').innerHTML = "<input type='button' class ='btn btn-block btn-lg btn-info' onclick='mostrarMapa();' value='Agrandar'>";
		 window.location.hash ="mapBox";
	 }
	 
	 $(document).ready(function(){
			$("#tablaS").hide();
			
		    $("#seleccion").click(function(){
		        $("#tablaS").toggle();
		    });
		    
		   
		    
		    

		});
	