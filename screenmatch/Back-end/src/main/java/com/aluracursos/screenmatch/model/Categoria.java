package com.aluracursos.screenmatch.model;

// Enumeración que representa las categorías de las series.
public enum Categoria {

    // Categoría  en inglés y español
    ACCION("Action", "Acción"),

    ROMANCE("Romance", "Romance"),

    COMEDIA("Comedy", "Comedia"),

    DRAMA("Drama", "Drama"),

    CRIMEN("Crime", "Crimen");

    // Atributos que almacenan los nombres de categoría en inglés y español
    private String categoriaOmdb; // Nombre de la categoría en inglés (usado para mapeo con OMDB API).
    private String categoriaEspanol; // Nombre de la categoría en español.

    // Constructor de la enumeración que asigna los nombres de categoría.
    Categoria(String categoriaOmdb, String categoriaEspanol) {
        this.categoriaOmdb = categoriaOmdb;
        this.categoriaEspanol = categoriaEspanol;
    }

    // Método para obtener la categoría a partir de su nombre en inglés.
    public static Categoria fromString(String text) {
        for (Categoria categoria : Categoria.values()) {
            if (categoria.categoriaOmdb.equalsIgnoreCase(text)) {
                return categoria;
            }
        }
        // Lanza una excepción si no se encuentra ninguna categoría con el nombre proporcionado.
        throw new IllegalArgumentException("Ninguna categoria encontrada: " + text);
    }
    // Método para obtener la categoría a partir de su nombre en español.
    public static Categoria fromEspanol(String text) {
        for (Categoria categoria : Categoria.values()) {
            if (categoria.categoriaEspanol.equalsIgnoreCase(text)) {
                return categoria;
            }
        }
        // Lanza una excepción si no se encuentra ninguna categoría con el nombre proporcionado.
        throw new IllegalArgumentException("Ninguna categoria encontrada: " + text);
    }

}
