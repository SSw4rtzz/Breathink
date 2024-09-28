namespace server.Models {
    public class Bookshelf {
        public int Id { get; set; }  // PK
        public string UserId { get; set; }  // FK utilizador
        public int BookId { get; set; }  // FK livro
        public bool IsRead { get; set; }  // Marcar se o utilizador já leu
        public bool ToRead { get; set; }  // Marcar se o utilizador quer ler
        public int Rating { get; set; }  // Classificação dada pelo utilizador (1-5 estrelas)
        public DateTime? DateRead { get; set; }  // Data em que o livro foi lido

        // Relacionamentos
        public ApplicationUser User { get; set; }
        public Book Book { get; set; }
    }
}
