namespace server.Models {

    /// <summary>
    /// Estado de um livro na estante de um utilizador (Lido, Por Ler, A Ler)
    /// </summary>
    public class State {
        public State() {
            BookList = new HashSet<Bookshelf>();
        }
        public int Id { get; set; }
        /// <summary>
        /// Nome do estado
        /// </summary>
        public required string state { get; set; }

        /// <summary>
		/// Lista de livros com este estado
		/// </summary>
		public ICollection<Bookshelf> BookList { get; set; }
    }
}
