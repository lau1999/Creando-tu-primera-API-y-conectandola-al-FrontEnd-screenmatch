package com.aluracursos.screenmatch.model;

import jakarta.persistence.*;

import java.util.List;
import java.util.OptionalDouble;

@Entity // Indica que esta clase es una entidad JPA.
@Table(name = "series") // Define el nombre de la tabla en la base de datos.
public class Serie {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) //Genera automáticamente valores de clave primaria.
    private Long Id; // Identificador único de la serie.
    @Column(unique = true) // Indica que este campo debe ser único en la base de datos.
    private String titulo; // Título de la serie.
    private Integer totalTemporadas; // Número total de temporadas de la serie.
    private Double evaluacion;  // Evaluación de la serie.
    private String poster; // URL del póster de la serie.
    @Enumerated(EnumType.STRING) // Mapea el género como una cadena de texto en la base de datos.
    private Categoria genero;  // Género de la serie.
    private String actores; // Lista de actores de la serie.
    private String sinopsis; // Sinopsis de la serie.

    // Indica una relación uno a muchos con la clase Episodio.
    // "mappedBy" especifica el nombre del campo en la clase Episodio que mapea la relación inversa.
    // "cascade" define cómo se propagarán las operaciones de persistencia desde Serie a Episodio.
    // "fetch" define cómo se cargarán los datos de la relación desde la base de datos.
    @OneToMany(mappedBy = "serie", cascade = CascadeType.ALL, fetch = FetchType.EAGER)

    // Lista de episodios de la serie.
    private List<Episodio> episodios;

    // Constructor por defecto.
    public Serie(){}

    // Constructor que toma un objeto DatosSerie para inicializar los atributos.
    public Serie(DatosSerie datosSerie){
        this.titulo = datosSerie.titulo();
        this.totalTemporadas = datosSerie.totalTemporadas();
        // Convierte la evaluación a un Double, si no es posible, se establece en 0.
        this.evaluacion = OptionalDouble.of(Double.valueOf(datosSerie.evaluacion())).orElse(0);
        this.poster = datosSerie.poster();
        // Convierte la cadena de género a una categoría utilizando el primer género de la lista proporcionada.
        this.genero = Categoria.fromString(datosSerie.genero().split(",")[0].trim());
        this.actores = datosSerie.actores();
        this.sinopsis = datosSerie.sinopsis();
    }

    // Método toString para representar la Serie como una cadena de texto.
    @Override
    public String toString() {
        return  "genero=" + genero +
                "titulo='" + titulo + '\'' +
                ", totalTemporadas=" + totalTemporadas +
                ", evaluacion=" + evaluacion +
                ", poster='" + poster + '\'' +
                ", actores='" + actores + '\'' +
                ", sinopsis='" + sinopsis + '\'' +
                ", episodios='" + episodios + '\'';

    }

    // Getters y setters para acceder y modificar los atributos de la serie.

    public List<Episodio> getEpisodios() {
        return episodios;
    }

    public void setEpisodios(List<Episodio> episodios) {
        episodios.forEach(e -> e.setSerie(this));
        this.episodios = episodios;
    }

    public Long getId() {
        return Id;
    }

    public void setId(Long id) {
        Id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public Integer getTotalTemporadas() {
        return totalTemporadas;
    }

    public void setTotalTemporadas(Integer totalTemporadas) {
        this.totalTemporadas = totalTemporadas;
    }

    public Double getEvaluacion() {
        return evaluacion;
    }

    public void setEvaluacion(Double evaluacion) {
        this.evaluacion = evaluacion;
    }

    public String getPoster() {
        return poster;
    }

    public void setPoster(String poster) {
        this.poster = poster;
    }

    public Categoria getGenero() {
        return genero;
    }

    public void setGenero(Categoria genero) {
        this.genero = genero;
    }

    public String getActores() {
        return actores;
    }

    public void setActores(String actores) {
        this.actores = actores;
    }

    public String getSinopsis() {
        return sinopsis;
    }

    public void setSinopsis(String sinopsis) {
        this.sinopsis = sinopsis;
    }
}