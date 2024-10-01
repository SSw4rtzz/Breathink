namespace server.Models {
    public class Book {
        public int Id { get; set; }  // PK
        public string? CoverPath { get; set; }  // Caminho para a capa do livro
        public string? Title { get; set; }
        public string? Author { get; set; }
        public string? ISBN { get; set; }
        public DateTime? PublishedDate { get; set; }
        public string? FilePath { get; set; }  // Caminho para o ficheiro epub/pdf

        // Metadados Adicionais
        public string? Genre { get; set; }
        public string? Publisher { get; set; }
        public int? PageCount { get; set; }
        public string? Language { get; set; }

        public double? AverageRating { get; set; }  // Média de classificação
    }
}
