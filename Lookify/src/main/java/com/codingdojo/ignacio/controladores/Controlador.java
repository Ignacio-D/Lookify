package com.codingdojo.ignacio.controladores;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.ignacio.modelos.Cancion;
import com.codingdojo.ignacio.servicios.Servicios;

import jakarta.validation.Valid;

@Controller
public class Controlador {

	@Autowired
	private Servicios servicio;
	
	@GetMapping("/")
	public String index() {
		return "index.jsp";
	}
	
	@GetMapping("/dashboard")
	public String dashboard(Model model) {
		
		List<Cancion> canciones = servicio.allCanciones();
		model.addAttribute("canciones", canciones);
		
		return "dashboard.jsp";
	}
	
	@GetMapping("/canciones/nuevo")
	public String cancionNueva(@ModelAttribute("cancion")Cancion cancion) {
		return "cancionNueva.jsp";
	}
	
	@PostMapping("/canciones")
	public String añadirCancion(@Valid @ModelAttribute("cancion")Cancion cancion, BindingResult resultado) {
		if(resultado.hasErrors()) {
			return "cancionNueva.jsp";
		} 
		servicio.saveCancion(cancion);
		return "redirect:/dashboard";
	}
	
	@GetMapping("buscar/top10")
	public String top(Model model) {
		List<Cancion> cancionesTop = servicio.top10();
		model.addAttribute("canciones", cancionesTop);
		return "top10.jsp";
	}
	
	@DeleteMapping("/borrar/{id}")
	public String borrar(@PathVariable("id")Long id) {
		servicio.deleteCancion(id);
		return "redirect:/dashboard";
	}
	
	@GetMapping("/canciones/{id}")
	public String detalles(@PathVariable("id")Long id,
							Model model) {
		
		Cancion cancionBuscada = servicio.findCancion(id);
		model.addAttribute("cancion", cancionBuscada);
		
		return "detalles.jsp";
	}
	
	@GetMapping("/buscar/{palabra}")
	public String buscar(@PathVariable("palabra")String palabra, Model model) {
		List<Cancion> cancionesConArtista = servicio.buscarPorArtista(palabra);
		model.addAttribute("canciones", cancionesConArtista);
		model.addAttribute("palabra", palabra);
				return "buscar.jsp";
				
	}
	
	@PostMapping("/busqueda")
	public String busqueda(@RequestParam("palabra")String palabra){
		return "redirect:/buscar/"+palabra;
	}
}
