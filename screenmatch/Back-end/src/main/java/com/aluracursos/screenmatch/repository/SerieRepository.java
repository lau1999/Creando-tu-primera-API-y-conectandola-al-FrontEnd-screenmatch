package com.aluracursos.screenmatch.repository;

import com.aluracursos.screenmatch.model.Categoria;
import com.aluracursos.screenmatch.model.Episodio;
import com.aluracursos.screenmatch.model.Serie;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface SerieRepository extends JpaRepository<Serie,Long> {

    // Encuentra una serie por título ignorando mayúsculas y minúsculas
    Optional<Serie> findByTituloContainsIgnoreCase(String nombreSerie);

    // Encuentra las 5 mejores series ordenadas por evaluación
    List<Serie> findTop5ByOrderByEvaluacionDesc();

    // Encuentra series por género
    List<Serie> findByGenero(Categoria categoria);

    // Encuentra series por total de temporadas y evaluación
    @Query("SELECT s FROM Serie s WHERE s.totalTemporadas <= :totalTemporadas AND s.evaluacion >= :evaluacion")
    List<Serie> seriesPorTemparadaYEvaluacion(int totalTemporadas, Double evaluacion);

    // Encuentra episodios por nombre de episodio
    @Query("SELECT e FROM Serie s JOIN s.episodios e WHERE e.titulo ILIKE %:nombreEpisodio%")
    List<Episodio> episodiosPorNombre(String nombreEpisodio);

    // Encuentra los 5 mejores episodios de una serie específica ordenados por evaluación
    @Query("SELECT e FROM Serie s JOIN s.episodios e WHERE s = :serie ORDER BY e.evaluacion DESC LIMIT 5 ")
    List<Episodio> top5Episodios(Serie serie);

    // 1.- Lanzamiento mas Recientes
    @Query("SELECT s FROM Serie s " + "JOIN s.episodios e " + "GROUP BY s " + "ORDER BY MAX(e.fechaDeLanzamiento) DESC LIMIT 5")
    List<Serie> lanzamientosMasRecientes();

   //obtenerTemporadasPorNumero
   @Query("SELECT e FROM Serie s JOIN s.episodios e WHERE s.id = :id AND e.temporada = :numeroTemporada")
   List<Episodio> obtenerTemporadasPorNumero(Long id, Long numeroTemporada);

}
