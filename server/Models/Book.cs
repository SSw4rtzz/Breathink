namespace server.Models {

    /// <summary>
    /// Dados dos livros
    /// </summary>
    public class Book {
        public int Id { get; set; }  // PK
        /// <summary>
        /// Capa do livro
        /// </summary>
        public string? CoverPath { get; set; }  // Caminho para a capa do livro
        /// <summary>
        /// Titulo do livro
        /// </summary>
        public string? Title { get; set; }
        /// <summary>
        /// Autor do livro
        /// </summary>
        public string? Author { get; set; }
        /// <summary>
        /// Código genérico do livro
        /// </summary>
        public string? ISBN { get; set; }
        /// <summary>
        /// Data de publicação
        /// </summary>
        public DateTime? PublishedDate { get; set; }
        /// <summary>
        /// Diretório do epub
        /// </summary>
        public string? FilePath { get; set; }  // Caminho para o ficheiro epub/pdf

        // Metadados Adicionais
        /// <summary>
        /// Genero do livro
        /// </summary>
        public string? Genre { get; set; }
        /// <summary>
        /// Editora do livro
        /// </summary>
        public string? Publisher { get; set; }
        /// <summary>
        /// Número de páginas do livro
        /// </summary>
        public int? PageCount { get; set; }
        /// <summary>
        /// Lingua de tradução do livro
        /// </summary>
        public string? Language { get; set; }

        /// <summary>
        /// Média de classificações
        /// </summary>
        public double? AverageRating { get; set; }  // Média de classificação

        public ICollection<Bookshelf> Bookshelves { get; set; } = new List<Bookshelf>();
    }
}
