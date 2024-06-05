package com.aluracursos.screenmatch.service;

import com.aluracursos.screenmatch.model.DatosSerie;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class ConvierteDatos implements IConvierteDatos {
    // Se crea un objeto ObjectMapper para convertir entre objetos Java y JSON
    private ObjectMapper objectMapper = new ObjectMapper();
    // Método para obtener datos de un JSON y convertirlos a un objeto de la clase especificada
    @Override
    public <T> T obtenerDatos(String json, Class<T> clase) {
        try {
            // Se utiliza ObjectMapper para convertir el JSON en un objeto de la clase especificada
            return objectMapper.readValue(json,clase);
        } catch (JsonProcessingException e) {
            // En caso de error al procesar el JSON, se lanza una excepción
            throw new RuntimeException(e);
        }
    }
}
