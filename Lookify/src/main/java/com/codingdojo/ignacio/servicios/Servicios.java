package com.codingdojo.ignacio.servicios;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.ignacio.modelos.Cancion;
import com.codingdojo.ignacio.repositorios.Repositorio;

@Service
public class Servicios {

	@Autowired
	private Repositorio repo; 
	
	public Cancion saveCancion(Cancion cancion) {
		return repo.save(cancion);
	}
	
	public Cancion findCancion(Long id) {
		return repo.findById(id).orElse(null);
	}
	
	public void deleteCancion(Long id) {
		repo.deleteById(id);
	}
	
	public List<Cancion> allCanciones(){
		return repo.findAll();
	}
	
	public List<Cancion> top10(){
		 return repo.findTop10ByOrderByRatingAsc();
	 }
	
	public List<Cancion> buscarPorArtista(String palabra){
		 return repo.findByArtistaContaining(palabra);
	 }
	 
}
