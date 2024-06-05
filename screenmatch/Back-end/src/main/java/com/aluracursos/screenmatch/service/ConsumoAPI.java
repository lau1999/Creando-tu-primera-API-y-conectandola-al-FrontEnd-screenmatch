package com.aluracursos.screenmatch.service;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

public class ConsumoAPI {
    // Método para obtener datos de una API dada una URL
    public String obtenerDatos(String url){
        // Se crea un cliente HTTP
        HttpClient client = HttpClient.newHttpClient();
        // Se construye una solicitud HTTP con la URL proporcionada
        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create(url))
                .build();
        // Se inicializa una variable para almacenar la respuesta HTTP
        HttpResponse<String> response = null;
        try {
            // Se envía la solicitud HTTP y se obtiene la respuesta
            response = client.send(request, HttpResponse.BodyHandlers.ofString());
        } catch (IOException e) {
            // En caso de error de E/S, se lanza una excepció
            throw new RuntimeException(e);
        } catch (InterruptedException e) {
            // En caso de interrupción, se lanza una excepción
            throw new RuntimeException(e);
        }
        // Se obtiene el cuerpo de la respuesta HTTP (en formato JSON)
        String json = response.body();
        // Se retorna el JSON obtenido
        return json;
    }
}
