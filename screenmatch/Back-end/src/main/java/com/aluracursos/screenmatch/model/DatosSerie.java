package com.aluracursos.screenmatch.model;

import com.fasterxml.jackson.annotation.JsonAlias;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

// Esta clase se utiliza para representar los datos de una serie obtenidos de una fuente JSON.
// Ignora cualquier propiedad desconocida durante la deserialización.
@JsonIgnoreProperties(ignoreUnknown = true)
public record DatosSerie(
        @JsonAlias("Title") String titulo,
        @JsonAlias("totalSeasons")Integer totalTemporadas,
        @JsonAlias("imdbRating") String evaluacion,
        @JsonAlias("Poster")String poster,
        @JsonAlias("Genre") String genero,
        @JsonAlias("Actors")String actores,
        @JsonAlias("Plot")String sinopsis)
{
}

//La anotación @JsonAlias se utiliza para especificar alias alternativos para los campos JSON
// durante la deserialización. Esto significa que, cuando Jackson convierte un JSON en un objeto
// Java, buscará tanto el nombre del campo original como los alias especificados en @JsonAlias.
// Esto proporciona flexibilidad al mapear los nombres de los campos JSON a los nombres de los
// atributos Java en caso de que difieran.



