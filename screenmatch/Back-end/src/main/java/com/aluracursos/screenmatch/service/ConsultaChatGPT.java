package com.aluracursos.screenmatch.service;

import com.theokanning.openai.completion.CompletionRequest;
import com.theokanning.openai.service.OpenAiService;

public class ConsultaChatGPT {
    // Método para obtener la traducción de un texto utilizando OpenAI
    public static String obtenerTraduccion(String texto) {
        // Se crea una instancia del servicio de OpenAI utilizando la clave de la API proporcionada
        OpenAiService service = new OpenAiService("TU-APIKEY-OPENIA");

        // Se crea una solicitud de completado con los parámetros necesarios
        CompletionRequest requisicion = CompletionRequest.builder()
                // Modelo de lenguaje a utilizar
                .model("gpt-3.5-turbo-instruct")
                // Texto de entrada para la solicitud
                .prompt("traduce a español el siguiente texto: " + texto)
                // Máximo número de tokens en la respuesta
                .maxTokens(1000)
                // Temperatura para la generación de respuestas (controla la creatividad)
                .temperature(0.7)
                .build();

        // Se envía la solicitud al servicio de OpenAI y se recibe la respuesta
        var respuesta = service.createCompletion(requisicion);
        // Se obtiene el texto de la primera opción de respuesta (la más probable)
        return respuesta.getChoices().get(0).getText();
    }

}
