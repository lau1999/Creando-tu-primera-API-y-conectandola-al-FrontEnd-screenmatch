package com.aluracursos.screenmatch.model;

import jakarta.persistence.*;

import java.time.LocalDate;
import java.time.format.DateTimeParseException;

@Entity // Indica que esta clase es una entidad JPA.
@Table(name = "episodios") // Define el nombre de la tabla en la base de datos.
public class Episodio {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Genera automáticamente valores de clave primaria.
    private Long Id; // Identificador único del episodio.
    private Integer temporada; // Número de temporada del episodio.
    private String titulo; // Título del episodio.
    private Integer numeroEpisodio; // Número del episodio dentro de la temporada.
    private Double evaluacion; // Evaluación del episodio.
    private LocalDate fechaDeLanzamiento;  // Fecha de lanzamiento del episodio.
    @ManyToOne // Indica una relación muchos a uno con la clase Serie.
    private Serie serie; // Serie a la que pertenece el episodio.

    //Constructor Por Defecto
    public Episodio(){

    }

    // Constructor que toma el número de temporada y los datos del episodio para inicializar los atributos.
    public Episodio(Integer numero, DatosEpisodio d) {
        this.temporada = numero;
        this.titulo = d.titulo();
        this.numeroEpisodio = d.numeroEpisodio();

        // Intenta convertir la evaluación a Double. Si falla, se establece en 0.0.
        try{
            this.evaluacion = Double.valueOf(d.evaluacion());
        }catch (NumberFormatException e){
            this.evaluacion = 0.0;
        }
        // Intenta analizar la fecha de lanzamiento. Si falla, se establece en null.
        try{
            this.fechaDeLanzamiento = LocalDate.parse(d.fechaDeLanzamiento());
        } catch (DateTimeParseException e){
            this.fechaDeLanzamiento = null;
        }

    }

    // Getters y setters para acceder y modificar los atributos del episodio.

    public Integer getTemporada() {
        return temporada;
    }

    public void setTemporada(Integer temporada) {
        this.temporada = temporada;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public Integer getNumeroEpisodio() {
        return numeroEpisodio;
    }

    public void setNumeroEpisodio(Integer numeroEpisodio) {
        this.numeroEpisodio = numeroEpisodio;
    }

    public Double getEvaluacion() {
        return evaluacion;
    }

    public void setEvaluacion(Double evaluacion) {
        this.evaluacion = evaluacion;
    }

    public LocalDate getFechaDeLanzamiento() {
        return fechaDeLanzamiento;
    }

    public void setFechaDeLanzamiento(LocalDate fechaDeLanzamiento) {
        this.fechaDeLanzamiento = fechaDeLanzamiento;
    }

    public Serie getSerie() {
        return serie;
    }

    public void setSerie(Serie serie) {
        this.serie = serie;
    }

    // Método toString para representar el episodio como una cadena de texto.
    @Override
    public String toString() {
        return
                "temporada=" + temporada +
                ", titulo='" + titulo + '\'' +
                ", numeroEpisodio=" + numeroEpisodio +
                ", evaluacion=" + evaluacion +
                ", fechaDeLanzamiento=" + fechaDeLanzamiento;
    }
}
